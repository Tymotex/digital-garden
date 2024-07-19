---
title: Firebase
description: Firebase
---

![[Knowledge/Engineering/Technologies/assets/firebase-wallpaper.webp|750]]
Firebase is a [[Knowledge/Engineering/Cloud/BaaS|BaaS]] platform which gives you set of services that help you start and scale your apps. It shares the same underlying infrastructure as [[Knowledge/Engineering/Technologies/Google Cloud|Google Cloud]] and is placed on the same bill.

Firebase consists of the following array of products:
- [Firebase Auth](https://firebase.google.com/products/auth) for setting up end-to-end user authentication without writing and maintaining the backend for it yourself.
- [Firebase DB](https://firebase.google.com/products/realtime-database), a realtime database (described as a giant JSON tree that bidirectionally communicates with clients, meaning updates can be pushed to connected clients).
- [Cloud Firestore](https://firebase.google.com/docs/firestore), a NoSQL database.
- [Firebase Hosting](https://firebase.google.com/docs/hosting) for deploying web apps and static content to a CDN.
- [Cloud Storage for Firebase](https://firebase.google.com/docs/storage) for storing files/blobs.
- [Cloud Functions for Firebase](https://firebase.google.com/docs/functions) for running backend code in response to events without having to maintain your own servers or cloud VMs. It's essentially a thin wrapper around [[Knowledge/Engineering/Technologies/Google Cloud#Cloud Functions|Google Cloud Functions]] (see [StackOverflow](https://stackoverflow.com/questions/42854865/what-is-the-difference-between-cloud-functions-and-firebase-functions)).
- [Firebase Remote Config](https://firebase.google.com/docs/remote-config).
... and a few more. They all have 'client-first' SDKs for JavaScript, Android, iOS, Flutter, Unity, etc. which means you can directly interact with Firebase products from your frontend without a backend.

The main concern of adopting Firebase is [vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in). Don't worry too much about it though.

#### Web Quick Setup
```javascript
// 1. Create a Firebase project, then register your web app at:
//    console.firebase.google.com.

// 2. In your project, get the JavaScript Firebase SDK
yarn add firebase

// 3. In your project, initialise firebase and the services you
//    intend to use. Grab all credentials from the Firebase console.

    import { initializeApp } from "firebase/app";
    import { getAuth } from "firebase/auth";
    import { getDatabase } from "firebase/database"; 
    // ... import more Firebase product SDKs as required.
    
    const firebaseConfig = {
      apiKey: "...",
      authDomain: "<project_id>.firebaseapp.com",
      projectId: "<project_id>",
      databaseURL: "https://<db_name>.firebaseio.com",
      ...
    };

    // Initialising Firebase and the services you intend to use.
    const app = initializeApp(firebaseConfig);
    const db = getDatabase(app);
    const auth = getAuth(app);
```

## Firebase Auth
Firebase Auth provides a bunch of services for implementing user registration, sign in, and sign out for your app in just a few lines of code. It also becomes painless to set up multiple auth providers like Google, Facebook, GitHub, etc.

### Snippets
Some code snippets to demonstrate Google sign-in, sign-out and grabbing Google profile information (sourced from the [official Codelab](https://firebase.google.com/codelabs/firebase-web)):
```javascript
import {                 // Firebase SDK auth functions.
    getAuth,
    onAuthStateChanged,
    GoogleAuthProvider,
    signInWithPopup,
    signOut,
} from 'firebase/auth';

// Signing in and out.
const signIn = async () => {
    var provider = new GoogleAuthProvider();
    await signInWithPopup(getAuth(), provider);
}
const signOutUser = () => signOut(getAuth())
const isUserSignedIn = () => !!getAuth().currentUser;

// Adding an event listener to when the auth state changes (ie. when the user
// signs in and out). This can be used to affect the UI, like the top nav.
const listenToAuthChange = () => onAuthStateChanged(getAuth(), (user) => {
    if (user) alert("Signed in");
});

// Retrieving things accessible in the user's Google profile like their name and display picture.
const getProfilePicUrl = () => getAuth().currentUser.photoURL || '/images/profile_placeholder.png';
const getUserName = () => getAuth().currentUser.displayName;
```

## Firebase Realtime Database
Firebase DB is a [[Knowledge/Engineering/Databases/NoSQL|NoSQL]] *realtime* database, credited with low latencies. Being a 'realtime' database just means that any updates from one client can be pushed to subscribed clients within milliseconds. In other words, it's like a pubsub system for quickly syncing and notifying clients with small bits of data. Firebase DB is a great choice compared to 'normal' databases like Cloud Firestore or PostgreSQL if you have a simple data model, small amount of data, and expect low-latency access. For more heavyweight use cases and longer term data storage, pick Cloud Firestore instead.

All data is stored as JSON, in fact a Firebase DB instance is described as just ["a cloud-hosted JSON tree"](https://firebase.google.com/docs/database/web/structure-data). It looks like this, for example:
```json
{
  "users": {
    "alovelace": {
      "name": "Ada Lovelace",
      "contacts": { "ghopper": true },
    },
    "ghopper": { ... },
    "eclarke": { ... }
  }
}
```

When users lose network connection, the changes they'd otherwise push to the database are persisted locally in a cache, and then when they reconnect, those changes are automatically merged with the database.

### Usage
[[Knowledge/Engineering/Technologies/Firebase#Web Quick Setup|Initialise the Firebase SDK]], create a Firebase database instance through the web console, then specify the `databaseURL` field in the initialisation config object.

```javascript
import { getDatabase, push, ref, onValue } from 'firebase/database';

const addUser = async () => {
    // Get a database handle (ie. a reference to it).
    const db = getDatabase();   
    const dbPath = ref(db, `users`);

    // Write a new user object to `users`.
    const reference = await push(dbPath, { name: "Andrew" });
    return reference.key;
};

const watchUsers = async () => {
    const usersRef = ref(getDatabase(), `users`);

    // Whenever the remote list of users changes, do something.
    onValue(usersRef, (snapshot) => {
        const currUsers = snapshot.val();
        // ... do something with the users.
    });
}:
```

### Local Realtime DB Emulator
Since you likely don't want to read/write data to a production database server while you're developing, you should use the local emulator for the realtime db, provided by Firebase. You'd also want to use this to integration or e2e tests.

```bash
# Run the init command to set up how the emulator runs, and what services should be emulated.
firebase init emulators

# Start the local emulator suite, which includes the DB emulator.
firebase emulators:start
```

Then in your client-side code, connect to it if you're locally hosting your website:
```javascript
import { connectDatabaseEmulator } from 'firebase/database';

if (location.hostname === "localhost") connectDatabaseEmulator(db, "localhost", 9000);
```

### Security Rules 
Security rules let you set the conditions that have to be passed to allow read or write access to a certain node in the database. You can also set [data validation rules](https://firebase.google.com/docs/reference/security/database) that enforce simple checks such as making sure that a field is a string with a certain length. They're specified in a file called `database.rules.json` by default. Applying the rules in `database.rules.json` is done with `firebase deploy --only database`.

**Example `database.rules.json`:**
```json
{
  "rules": {
    // Allow any read/write attempt:
    ".read": true,
    ".write": true,
    "users": {
      // '$user' is a wildcard for all keys under 'users'. The value is accessible through references to `$user`.
      // You can give it any name you want.
      "$user": {   
        "name": {
          ".validate": "newData.isString() && newData.val().length > 0 && newData.val().length <= 255"
        },
      }
    }
  }
}
```

## Firebase CLI
The Firebase CLI is for deploying and managing projects from the terminal.
```bash
# Setup:
yarn global add firebase-tools
firebase --version
```

Some useful commands:
```bash
firebase init    # Creates `firebase.json` in the current directory and proceeds with
                 # a guided setup of your services.
firebase use     # View project aliases.
firebase serve   # Locally host the project so you can test it out before deploying to production.
firebase deploy  # Deploy resources to your Firebase project. E.g. use this to set configuration and security rules.
```

