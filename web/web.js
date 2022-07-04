// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBYXD0gwlbTkhjjrhmshal0ec6QDsj-b2k",
  authDomain: "phs-by-karthikeyan.firebaseapp.com",
  databaseURL: "https://phs-by-karthikeyan-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "phs-by-karthikeyan",
  storageBucket: "phs-by-karthikeyan.appspot.com",
  messagingSenderId: "299401924226",
  appId: "1:299401924226:web:27aea79f8f64d858b1ee9b",
  measurementId: "${config.measurementId}"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);