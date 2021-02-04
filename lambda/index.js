const fetch = require('node-fetch')

const { BASE_URL } = process.env

const handler = async (event, _context) => {
  try {
    const id = event.path
    const res = await fetch(`${BASE_URL}/${id}`)
    const data = await res.json()

    return {
      statusCode: 200,
      body: JSON.stringify(data)
    }
  } catch (err) {
    return {
      statusCode: 500,
      body: JSON.stringify(err)
    }
  }
}

module.exports = { handler }
