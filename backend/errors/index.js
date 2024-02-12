const {CustomAPIError, createCustomError} = require('./custom-error')
const BadRequestError = require('./bad-request')
const UnauthenticatedError = require('./unauthenticated')
const InternalServerError = require('./InternalServerError')
const ForbiddenError = require('./forbidden-error')
module.exports = {
  createCustomError,
  CustomAPIError,
  BadRequestError,
  UnauthenticatedError,
  InternalServerError,
  ForbiddenError
}
