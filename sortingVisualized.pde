import java.util.PriorityQueue;
import java.util.Collections;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

PFont f;

boolean bogoAdvance=true;

Thread tQS;
Thread tMS;
Thread tSS;
Thread tIS;
Thread tHS;
Thread tGS;
Thread tBBS;
Thread tCS;
Thread tPS;
Thread tBGS;

float[]vec;
int number=5;
int delayT=20;

//Quick global variables
int pivotIndex;

//Merge global variables
int kMS;

//Selection global variables
int kSS=0;
int jSS;
int iSS;

//Insertion global variables
int jIS;
int kIS;

//Gnome global variables
int pos;

//Bubble global vars
int iBS;
int jBS;

//cocktail global vars
int iCS;
int end;
int start;
String direction;

//pancake global vars
int startval;
int jval;

//heap global variables
int jHS=0;
int kHS=0;
boolean heapified=false;

//bogo global vars
int iBG;

float wide=1200;
float tall=800;
float w = 200;
float h = tall/10;

float x1 = wide-w;
float y1 = 0;
float x2 = wide-w;
float y2 = h;
float x3 = wide-w;
float y3 = 2*h;
float x4 = wide-w;
float y4 = 3*h;
float x5 = wide-w;
float y5 = 4*h;
float x6 = wide-w;
float y6 = 5*h;
float x7 = wide-w;
float y7 = 6*h;
float x8 = wide-w;
float y8 = 7*h;
float x9 = wide-w;
float y9 = 8*h;
float x10 = wide-w;
float y10 = 9*h;
//float x11 = wide-w;
//float y11 = 10*h;
//float x12 = wide-w;
//float y12 = 11*h;

void setup(){
   
   f = createFont("Arial",16,true);
  
   size(1200,800);
   background(255);
   stroke(0);
   noFill();
 
  //Generate a random list of rectangle heights in between 1 and height of screen
  //the amount of heights is width/number where number can be modified
  vec=new float[(width-200)/number];
  //vec=new float[4];
  for(int v=0; v<vec.length; v++){
    vec[v]=random(1, height);
  }
}

void draw(){
 
if(tQS==null || !tQS.isAlive()){
  //Create a thread t that runs quicksort
  tQS=new Thread(){
      public void run(){
        quickSort(vec, 0, vec.length-1);
      }
    };
}

if(tMS==null || !tMS.isAlive()){
  //Create a thread t that runs quicksort
  tMS=new Thread(){
      public void run(){
        mergeSort(vec, 0, vec.length-1);
      }
    };
}

if(tSS==null || !tSS.isAlive()){
  //Create a thread t that runs quicksort
  tSS=new Thread(){
      public void run(){
        selectionSort(vec);
      }
    };
}

if(tIS==null || !tIS.isAlive()){
  //Create a thread t that runs quicksort
  tIS=new Thread(){
      public void run(){
        insertionSort(vec);
      }
    };
}

if(tGS==null || !tGS.isAlive()){
  //Create a thread t that runs quicksort
  tGS=new Thread(){
      public void run(){
        gnomeSort(vec);
      }
    };
}

if(tBBS==null || !tBBS.isAlive()){
  //Create a thread t that runs quicksort
  tBBS=new Thread(){
      public void run(){
        bubbleSort(vec);
      }
    };
}

if(tCS==null || !tCS.isAlive()){
  //Create a thread t that runs quicksort
  tCS=new Thread(){
      public void run(){
        cocktailShakerSort(vec);
      }
    };
}

if(tPS==null || !tPS.isAlive()){
  //Create a thread t that runs quicksort
  tPS=new Thread(){
      public void run(){
        pancakeSort(vec, vec.length);
      }
    };
}

//if(tBGS==null || !tBGS.isAlive()){
//  //Create a thread t that runs quicksort
//  tBGS=new Thread(){
//      public void run(){
//        while(!this.isInterrupted()){
//            bogoSort(vec);
//        }
//      }
//    };
//}

if(tHS==null || !tHS.isAlive()){
  //Create a thread t that runs quicksort
  tHS=new Thread(){
      public void run(){
        heapSort(vec);
      }
    };
}
  
 background(0);
 
 fill(0,0,255);
 rect(x1,y1,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Shuffle",x1+w/4,y1+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x2,y2,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Quick Sort",x2+w/4,y2+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x3,y3,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Merge Sort",x3+w/4,y3+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x4,y4,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Selection Sort",x4+w/4,y4+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x5,y5,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Insertion Sort",x5+w/4,y5+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x6,y6,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Heap Sort",x6+w/4,y6+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x7,y7,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Gnome Sort",x7+w/4,y7+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x8,y8,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Bubble Sort",x8+w/4,y8+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x9,y9,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Cocktail Shaker Sort",x9+w/6,y9+h/2);   // STEP 5 Display Text
 
 fill(0,0,255);
 rect(x10,y10,w,h);
 textFont(f,16);                  // STEP 3 Specify font to be used
 fill(0, 255, 0);                         // STEP 4 Specify font color
 text("Pancake Sort",x10+w/4,y10+h/2);   // STEP 5 Display Text
 
 //fill(0,0,255);
 //rect(x11,y11,w,h);
 //textFont(f,16);                  // STEP 3 Specify font to be used
 //fill(0, 255, 0);                         // STEP 4 Specify font color
 //text("Bogo Sort",x11+w/4,y11+h/2);   // STEP 5 Display Text
 
 //fill(0,0,255);
 //rect(x12,y12,w,h);
 //textFont(f,16);                  // STEP 3 Specify font to be used
 //fill(0, 255, 0);                         // STEP 4 Specify font color
 //text("Kill",x12+w/4,y12+h/2);   // STEP 5 Display Text
 
 if(mousePressed){
    if(mouseX>x1 && mouseX <x1+w && mouseY>y1 && mouseY <y1+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){

       println("Shuffling!");
       fill(0);
       //do stuff 
       //rerandomize the vector
       for(int v=0; v<vec.length; v++){
          vec[v]=random(1, height);
        }
        //pivotIndex=0;
      }
      
     if(mouseX>x2 && mouseX <x2+w && mouseY>y2 && mouseY <y2+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       //in the above if statement add the conditions that all of the named program threads
       //are either null or not alive
       
       //do the same for each of the 9 more if User I/O statements below
       println("Quick Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tQS.start();}catch(Exception e){};
      }
      
     if(mouseX>x3 && mouseX <x3+w && mouseY>y3 && mouseY <y3+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Merge Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tMS.start();}catch(Exception e){};
      }
      
     if(mouseX>x4 && mouseX <x4+w && mouseY>y4 && mouseY <y4+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Selection Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tSS.start();}catch(Exception e){};
      }
      
     if(mouseX>x5 && mouseX <x5+w && mouseY>y5 && mouseY <y5+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Insertion Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tIS.start();}catch(Exception e){};
      }
      
      if(mouseX>x6 && mouseX <x6+w && mouseY>y6 && mouseY <y6+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Heap Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tHS.start();}catch(Exception e){};
      }
      
     if(mouseX>x7 && mouseX <x7+w && mouseY>y7 && mouseY <y7+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Gnome Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tGS.start();}catch(Exception e){};
      }
      
     if(mouseX>x8 && mouseX <x8+w && mouseY>y8 && mouseY <y8+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Bubble Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tBBS.start();}catch(Exception e){};
      }
      
     if(mouseX>x9 && mouseX <x9+w && mouseY>y9 && mouseY <y9+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Cocktail Shaker Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tCS.start();}catch(Exception e){};
      }
      
      if(mouseX>x10 && mouseX <x10+w && mouseY>y10 && mouseY <y10+h && (tQS==null || !tQS.isAlive())
        && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
        && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
        && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
       println("Pancake Sort!");
       fill(0);
       //do stuff 
       //sort it
       try{tPS.start();}catch(Exception e){};
      }
      
      //if(mouseX>x11 && mouseX <x11+w && mouseY>y11 && mouseY <y11+h && (tQS==null || !tQS.isAlive())
      //  && (tMS==null || !tMS.isAlive()) && (tSS==null || !tSS.isAlive()) && (tIS==null || !tIS.isAlive())
      //  && (tBBS==null || !tBBS.isAlive()) && (tBGS==null || !tBGS.isAlive()) && (tGS==null || !tGS.isAlive())
      //  && (tHS==null || !tHS.isAlive()) && (tCS==null || !tCS.isAlive()) && (tPS==null || !tPS.isAlive())){
      // println("Insertion Sort!");
      // fill(0);
      // //do stuff 
      // //sort it
      // try{tBGS.start();}catch(Exception e){};
      //}
      
      //if(mouseX>x12 && mouseX <x12+w && mouseY>y12 && mouseY <y12+h){
      // println("Insertion Sort!");
      // fill(0);
      // //do stuff 
      // //sort it
      // if(tQS!=null && tQS.isAlive()){
      //     try{tQS.interrupt();}catch(Exception e){};
      // }
      // else if(tMS!=null && tMS.isAlive()){
      //     try{tMS.interrupt();}catch(Exception e){};
      // }
      // else if(tSS!=null && tSS.isAlive()){
      //     try{tSS.interrupt();}catch(Exception e){};
      // }
      // else if(tIS!=null && tIS.isAlive()){
      //     try{tSS.interrupt();}catch(Exception e){};
      // }
      // else if(tBGS!=null && tBGS.isAlive()){
      //     //try{tBGS.interrupt();}catch(Exception e){println("Couldn't stop");};
      //     bogoAdvance=false;
      //     tBGS.interrupt();
      // }
      // else if(tBBS!=null && tBBS.isAlive()){
      //     try{tBBS.interrupt();}catch(Exception e){};
      // }
      // else if(tHS!=null && tHS.isAlive()){
      //     try{tHS.interrupt();}catch(Exception e){};
      // }
      // else if(tPS!=null && tPS.isAlive()){
      //     try{tPS.interrupt();}catch(Exception e){};
      // }
      // else if(tGS!=null && tGS.isAlive()){
      //     try{tGS.interrupt();}catch(Exception e){};
      // }
      // else if(tCS!=null && tCS.isAlive()){
      //     try{tCS.interrupt();}catch(Exception e){};
      // }
      //}
   }
   
   for(int idx=0; idx<vec.length; idx++){
    if(idx==pivotIndex && tQS!=null && tQS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==kMS && tMS!=null && tMS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==iSS && tSS!=null && tSS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==jIS-1 && tIS!=null && tIS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==pos && tGS!=null && tGS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==jBS && tBBS!=null && tBBS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(idx==iCS && tCS!=null && tCS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if((idx==startval || idx==jval) && tPS!=null && tPS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    else if(((idx==vec.length-1-kHS && heapified) || (idx==jHS && !heapified)) && tHS!=null && tHS.isAlive()){
        fill(255, 0, 0);
        rect(idx*number, height-vec[idx], number, vec[idx]);
    }
    //else if(idx==iBG && tBGS!=null && tBGS.isAlive()){
    //    fill(255, 0, 0);
    //    rect(idx*number, height-vec[idx], number, vec[idx]);
    //}
    else{
    fill(255);
    rect(idx*number, height-vec[idx], number, vec[idx]);
    }
  }
}

//Define the quicksort function
void quickSort(float[]arr, int start, int end){
  if(start>=end){return;}
  
  int index=partition(arr, start, end);
  pivotIndex=index;
  quickSort(arr, start, index-1);
  quickSort(arr, index+1, end);
}

//Define the partition function needed for quicksort
int partition(float[]arr, int start, int end){
  float pivot=arr[end];
  int pivotIndex=start;
  for(int i=start; i<=end; i++){
    if(arr[i]<pivot){
      swap(vec, i, pivotIndex);
      pivotIndex++; 
    }
  }
  
  swap(vec, pivotIndex, end);
  
  return pivotIndex;
}

//Define the swap function
//Every time a thread calls swap, we pause that thread for a time delayT
//and redraw(), i.e. call draw again
void swap(float[] arr, int a, int b){
  float temp=arr[a];
  arr[a]=arr[b];
  arr[b]=temp;
  try {Thread.sleep(delayT);}catch(Exception e){};
  redraw();
}

void merge(float arr[], int l, int m, int r){
      // Find sizes of two subarrays to be merged
      int n1 = m - l + 1;
      int n2 = r - m;
      
      /* Create temp arrays */
      float L[] = new float[n1];
      float R[] = new float[n2];
 
      /*Copy data to temp arrays*/
      for (int i = 0; i < n1; ++i)
          L[i] = arr[l + i];
      for (int j = 0; j < n2; ++j)
          R[j] = arr[m + 1 + j];
 
      /* Merge the temp arrays */
 
      // Initial indexes of first and second subarrays
      int i = 0, j = 0;
      
      // Initial index of merged subarray array
      kMS = l;
      while (i < n1 && j < n2) {
          if (L[i] <= R[j]) {
              arr[kMS] = L[i];
              i++;
              try {Thread.sleep(delayT);}catch(Exception e){};
              redraw();
          }
          else {
              arr[kMS] = R[j];
              j++;
              try {Thread.sleep(delayT);}catch(Exception e){};
              redraw();
          }
          kMS++;
      }
 
      /* Copy remaining elements of L[] if any */
      while (i < n1) {
          arr[kMS] = L[i];
          i++;
          kMS++;
          try {Thread.sleep(delayT);}catch(Exception e){};
          redraw();
      }
 
      /* Copy remaining elements of R[] if any */
      while (j < n2) {
          arr[kMS] = R[j];
          j++;
          kMS++;
          try {Thread.sleep(delayT);}catch(Exception e){};
          redraw();
      }
}

void mergeSort(float arr[], int l, int r){
  if (l < r) {
    // Find the middle point
    int m =l+ (r-l)/2;
 
    // Sort first and second halves
    mergeSort(arr, l, m);
    try {Thread.sleep(delayT);}catch(Exception e){};
    redraw();
    mergeSort(arr, m + 1, r);
    try {Thread.sleep(delayT);}catch(Exception e){};
    redraw();
 
    // Merge the sorted halves
    merge(arr, l, m, r);
    try {Thread.sleep(delayT);}catch(Exception e){};
    redraw();
   }
}

void selectionSort(float arr[]){
    for(kSS=0; kSS<arr.length; kSS++){
      jSS=kSS+1; iSS=kSS;
      for(jSS=kSS+1; jSS<arr.length; jSS++){
          if(arr[jSS]<arr[iSS]){
            iSS=jSS;
          }
      }
      try {Thread.sleep(delayT);}catch(Exception e){};
      redraw();
      float temp=arr[kSS];
      arr[kSS]=arr[iSS];
      arr[iSS]=temp;
    }
}

void insertionSort(float arr[]){
  for(kIS=0; kIS<arr.length; kIS++){
    jIS=kIS;
    while (0 < jIS && arr[jIS-1] > arr[jIS]) {
       swap(arr, jIS, jIS-1);
       jIS--;
    }
  }
}

void gnomeSort(float arr[]){
    pos=0;
    while(pos<arr.length){
        try {Thread.sleep(delayT);}catch(Exception e){};
        redraw();
        if(pos==0 || arr[pos]>=arr[pos-1]){
            pos++;
        }
        else{
          float temp=vec[pos];
          vec[pos]=vec[pos-1];
          vec[pos-1]=temp;
          pos--;
        }
    }
}

void bubbleSort(float arr[]){
  for(iBS=0; iBS<arr.length; iBS++){
    for(jBS=0; jBS<arr.length-iBS-1; jBS++){
      try {Thread.sleep(delayT);}catch(Exception e){};
      redraw();
      if(arr[jBS]>arr[jBS+1]){
            float temp=arr[jBS];
            arr[jBS]=arr[jBS+1];
            arr[jBS+1]=temp;
      }
    }
  }
}

void cocktailShakerSort(float arr[]){
  
    iCS=0; start=0; end=arr.length-1; direction="up";
    
    while(iCS<=end && iCS>=start){
        if(direction=="up" && arr[iCS]>vec[iCS+1] && iCS<=end){
              try {Thread.sleep(delayT);}catch(Exception e){};
              redraw();
              float temp=arr[iCS];
              arr[iCS]=arr[iCS+1];
              arr[iCS+1]=temp;
            }
    
        else if(direction=="down" && arr[iCS]<arr[iCS-1] && iCS>=start){
            try {Thread.sleep(delayT);}catch(Exception e){};
            redraw();
            float temp=arr[iCS];
            arr[iCS]=arr[iCS-1];
            arr[iCS-1]=temp;
          }
    
       if(direction=="up"){
          iCS++;
          try {Thread.sleep(delayT);}catch(Exception e){};
          redraw();
          if(iCS>end-1){
            direction="down";
            iCS--;
            end=end-1;
          }
        }
    
       else if(direction=="down"){
          iCS--;
          try {Thread.sleep(delayT);}catch(Exception e){};
          redraw();
          if(iCS<=start){
            direction="up";
            iCS++;
            start=start+1;
          }
        }
      }
}

void flip(float arr[], int j){
    int start = 0;
    while (start < j){
        float temp = arr[start];
        arr[start] = arr[j];
        arr[j] = temp;
        startval=start;
        jval=j;
        try {Thread.sleep(delayT);}catch(Exception e){};
        redraw();
        start++;
        j--;
    }
}

int findMax(float arr[], int n){
    int mi=0;
    for(int i=0; i<n; i++){
        if(arr[i]>arr[mi]){
            mi=i;
        }
    }
    try {Thread.sleep(delayT);}catch(Exception e){};
    redraw();
    return mi;
}

void pancakeSort(float arr[], int n){
    for(int curr_size=n; curr_size>1; curr_size--){
        int mi=findMax(arr, curr_size);
        if(mi!=curr_size-1){
             flip(arr, mi);
             try {Thread.sleep(delayT);}catch(Exception e){};
             redraw();
             flip(arr, curr_size-1);
             try {Thread.sleep(delayT);}catch(Exception e){};
             redraw();
        }
    }
}

//void bogoSort(float arr[]){
  
//  while (!sorted(vec)){
//    //println("cycle");
//    List<Float> arrList= arrayToList(arr);
//    Collections.shuffle(arrList);
//    vec=listToArray(arrList);
//    println(arr);
//    //try {Thread.sleep(delayT);}catch(Exception e){};
//    //redraw();
//  }
    
//}

//boolean sorted(float arr[]){
//  for(iBG=0; iBG<arr.length-1; iBG++){
//      try {Thread.sleep(delayT);}catch(Exception e){};
//      redraw();
//      if(arr[iBG]>arr[iBG+1]){
//          return false;
//      }
//  }
//  return true;
//}

//List<Float> arrayToList(float arr[]){
//  List<Float> res=new ArrayList<>();
//  for(int i=0; i<arr.length; i++){
//      res.add((Float)arr[i]);
//      //println("added Float");
//  }
//  return res;
//}

//float[] listToArray(List<Float> list){
// float[] res=new float[list.size()];
// for(int i=0; i<list.size(); i++){
//      res[i]=(float)list.get(i);
//      //println("added float");
//  }
// return res;
//}

void heapSort(float arr[]){
    PriorityQueue<Float> pQueue= new PriorityQueue<Float>(Collections.reverseOrder());
    jHS=0;
    
    for(int v=0; v<arr.length; v++){
        pQueue.add(arr[v]);
      }
  
    Object[] ObjArr = pQueue.toArray();
    
    while (jHS<arr.length){
      arr[jHS]=(float)ObjArr[jHS];
      try {Thread.sleep(delayT);}catch(Exception e){println("error");};
      redraw();
      jHS++;
    }
    
    heapified=true;
    println("got here");
    kHS=0;
    
    while (pQueue.size()>0 && jHS>=arr.length){
      arr[arr.length-1-kHS]=pQueue.poll();
      try {Thread.sleep(delayT);}catch(Exception e){println("error");};
      redraw();
      kHS++;
    }
   
   heapified=false;
}
