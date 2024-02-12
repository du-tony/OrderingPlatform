const jwt = require('jsonwebtoken')
const { UnauthenticatedError } = require('../errors')

const authenticationMiddleware = async (req, res, next) => {
  const authHeader = req.headers.authorization
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return next(new UnauthenticatedError('No token provided'));
  }
  const token = authHeader.split(' ')[1]
  try {
    const decoded = jwt.verify(token, process.env.SECRET_KEY)
    req.user = { 
      'userid': decoded.userid,
      'roleid': decoded.roleid,
      'username': decoded.username,
      'gender': decoded.gender
     }
    next()
  } catch (error) {
    console.log(error)
    next(new UnauthenticatedError('Not authorized to access this route'))
  }
}
const checkRole = (req,matchRoleId)=>{
  return req.user && req.user.roleid && req.user.roleid == matchRoleId
}

const adminAuthMiddleware = async (req, res, next) => {
  try {
    const isAdmin = checkRole(req, 1);
    if(isAdmin===false){
      return next(new UnauthenticatedError('Only Admin is authorized.'))
    }
    next()
  } catch (error) {
    next(new UnauthenticatedError('Not authorized to access this route'))
  }
}
const technicianAuthMiddleware = async (req, res, next) => {
  try {
    const isTechnician = checkRole(req, 2);
    if(isTechnician===false){
      return next(new UnauthenticatedError('Only Admin is authorized.'))
    }
    next()
  } catch (error) {
    next(new UnauthenticatedError('Not authorized to access this route'))
  }
}
const dentistAuthMiddleware = async (req, res, next) => {
  try {
    const isDentist = checkRole(req, 3);
    if(isDentist===false){
      return next(new UnauthenticatedError('Only Admin is authorized.'))
    }
    next()
  } catch (error) {
    next(new UnauthenticatedError('Not authorized to access this route'))
  }
}


module.exports = {authenticationMiddleware, adminAuthMiddleware, technicianAuthMiddleware, dentistAuthMiddleware}
