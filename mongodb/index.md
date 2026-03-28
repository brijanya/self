---
layout: default
---

# Mongo DB (node.js driver)

### Integrating Mongo DB with Next.js project

The Node.js driver is a library of functions that you can use to connect to and communicate with MongoDB.

### Initialise a folder with node:
This creates a `package.json` file in the working directory

```bash
npm init -y
```

### Install the Mongo BD driver
```bash
npm install mongodb@7.1
```

Create a free tier Mongo DB cluster on the cloud. Mongo DB uses a connection string that includes the hostname or IP address and port of your deployment, the authentication mechanism, user credentials when applicable, and connection options .

Copy the connection string below into a file and replace the `<db_usename>`,  `<db_passowrd>`, `<db_cluster_name>` placeholder with the mongo db credential
```
mongodb+srv://<db_username>:<db_password>@cluster0.vadi1.mongodb.net/?appName=<db_cluster_name>
```

Create a file in the working directory named `index.js` and use the code sample below to test the mongo db connection.

```javascript
const { MongoClient, ServerApiVersion } = require('mongodb');

async function runGetStarted() {
  // Replace the uri string with your connection string
  const uri = '<connection string URI>';
  const client = new MongoClient(uri, 
  {serverApi: {
    version: ServerApiVersion.v1, 
    strict: true,
    deprecationError: true,
  }});

  try {
    const database = client.db('sample_mflix');
    const movies = database.collection('movies');

    // Queries for a movie that has a title value of 'Back to the Future'
    const query = { title: 'Back to the Future' };
    const movie = await movies.findOne(query);
    console.log(movie);
  } finally {
    await client.close();
  }
}
runGetStarted().catch(console.dir);
```

To add listen to the connection events you can add listeners as below
```javascript
// listen for connectionCreated event
client.on('connectionCreated', (event) => {
	console.log("New connection created | ID : ${event.connectionID}")
});

// listen for connectionPoolCleared event
client.on('connectionPoolCleared', (event) => {
	console.log("Connection pool cleared")
});

// check active status
const stats = client.topology.description
```

### Connection Pools
[Connection Pool](https://www.mongodb.com/docs/drivers/node/current/connect/connection-options/connection-pools/#std-label-node-connection-pools)


### Accessing and creating a database or collections
Call the `db()` method in the `MongoClient` instance. This returns a `Db` instance. The `<database_name>` should be in quotes
```javascript
const database = client.db(<database_name>)
```

To access a collection call the `collection()` method on a `Db` instance. The `<collection name>` should be in quotes.
```javascript
const collection = database.collection(<collection_name>)
```

It the collection does not exists, Mongo DB creates a collection when data is first inserted into it.
To explicitly create a collection call `createCollection()` on `Db` instance.
```javascript
const createColl = await database.createCollection(<collection_name>)
```

[`create` command](https://www.mongodb.com/docs/manual/reference/command/create/) 

To get a list of collections use the `listCollections()` on `Db` instance
```javascript
const colls = database.listCollections();
for await (const doc of colls){
	console.log(doc);
}
```
### Resources
1. [Link to Mongo DB Docs](https://www.mongodb.com/docs/drivers/node/current/get-started/$0)
2. [Drivers for other languages](https://www.mongodb.com/docs/drivers/)
3. 
