const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server();
conosle.log(12)

database.connect( process.env.CONNECTIONSTRING )
server.use( '/', mocks.server( server.Router(), false, false ) )
server.use( '/foo', (req, res) => {
    return res.json({ "foo": "bar" })
})
server.start()