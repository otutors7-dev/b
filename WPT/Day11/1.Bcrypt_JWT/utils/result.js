function createResult(data, error) {
    if (data)
        return createSuccessResult(data)
    else
        return createErrorResult(error)

}

function createSuccessResult(data) {
    const result = {
        status: 'success',
        data
    }
    return result
}

function createErrorResult(error) {
    const result = {
        status: 'error',
        error
    }
    return result
}

module.exports = { createResult, createSuccessResult, createErrorResult }