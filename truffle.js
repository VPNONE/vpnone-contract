module.exports = {
  	// See <http://truffleframework.com/docs/advanced/configuration>
  	// to customize your Truffle configuration!
  	networks: {
    	// development: {
     //  		host: 'localhost',
     //  		port: 8545,
     //  		network_id: '*', // eslint-disable-line camelcase
    	// },
	    // ropsten: {
	    //   	provider: ropstenProvider,
	    //   	network_id: 3, // eslint-disable-line camelcase
	    // },
	    // coverage: {
		   //    host: 'localhost',
		   //    network_id: '*', // eslint-disable-line camelcase
		   //    port: 8555,
		   //    gas: 0xfffffffffff,
		   //    gasPrice: 0x01,
	    // },
	    // testrpc: {
		   //    host: 'localhost',
		   //    port: 8545,
		   //    network_id: '*', // eslint-disable-line camelcase
	    // },
	    development: {
		      host: 'localhost',
		      port: 8545,
		      network_id: '*', // eslint-disable-line camelcase
	    },
  },
};
