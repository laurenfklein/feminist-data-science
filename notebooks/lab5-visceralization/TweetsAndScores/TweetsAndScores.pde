// The following short CSV file called "mammals.csv" is parsed
// in the code below. It must be in the project's "data" folder.
//
// id,species,name
// 0,Capra hircus,Goat
// 1,Panthera pardus,Leopard
// 2,Equus zebra,Zebra
import processing.serial.*; //imports serial library
Serial port;     //declares a serial object called "port"

Table table; //declares a table object called "table"

int thisTweet = 0; //initializes our variable (which tweet we are currently looking at)

int numberOfTweets = 0;

int[] score; //stored score in an array

String[] tweetText; //text stored as an array of strings

void setup() {
  println("Available serial ports:"); //gives us all the serial ports that are connected
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());

   port = new Serial(this, "/dev/cu.usbmodem1421", 9600); //inializing which port we're connecting to




  table = loadTable("scores_and_tweets.csv", "header"); //loading the table

  println(table.getRowCount() + " total rows in table"); 
  numberOfTweets = table.getRowCount();  //resets number of tweets to number of rows in our table
  score = new int[numberOfTweets];
  tweetText = new String[numberOfTweets];
  for (TableRow row : table.rows()) {

    float score1 = row.getFloat("score");
     tweetText[thisTweet] = row.getString("tweet"); //storing tweets in array
    int  scoreRemapped = floor(map(score1, -1, 1, 0, 255)); 
    // String name = row.getString("name");

    score[thisTweet] = int(scoreRemapped);
    thisTweet++;
    //println( (scoreRemapped ) + " " +  tweet1  );
    
  }
  thisTweet= 1;
}

// Sketch prints:
// 3 total rows in table
// Goat (Capra hircus) has an ID of 0
// Leopard (Panthera pardus) has an ID of 1
// Zebra (Equus zebra) has an ID of 2

void draw() {

  if (frameCount % 300 == 0) {
    port.write(score[thisTweet]);
    print(score[thisTweet]);
    println(" " + tweetText[thisTweet]);
    
    //tweet is the index number of the tweet referred to, tweet1 is the string
    thisTweet+=2; //telling sketch to skip every other tweet
    if (thisTweet >= numberOfTweets) {
      thisTweet =1;
    }
  }
}
