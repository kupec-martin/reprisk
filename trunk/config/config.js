
module.exports = {
  minJS: false,
  compress: false,

  connectionString: 'postgres://postgres@172.17.42.1:5432/genesis',

  serverPort: 3000,
  logSql : false,

  sessionStore: {
    host: '172.17.42.1',
    port: 6379
  },
  sessionTTL: 30 * 60, // 30 minutes session timeout

  cacheStore: {
    host: '172.17.42.1',
    port: 6379,
    prefix: ''
  },


  pluginConfig: {
    hideRawReporting: true
  },


  logger: [
    {
      level: 'debug',           // levels: fatal, error, info, debug
      type: 'rotating-file',
      path: '/tmp/anubis.log',
      period: '1d',             // daily rotation
      count: 3                  // keep 3 back copies
    }
  ]
}
