// hello world is a placeholder for now

import { AppServer } from '@mentra/sdk';

class MyApp extends AppServer {
  protected async onSession(session, sessionId, userId) {
    // Display "Hello World" on the glasses
    session.layouts.showTextWall("Hello World from MentraOS!");
    
    // Log when user speaks
    session.events.onTranscription((data) => {
      console.log(`User said: ${data.text}`);
    });
  }
}

const app = new MyApp({
  packageName: 'com.example.myapp',
  apiKey: process.env.MENTRA_API_KEY,
  port: 3000
});

app.start();