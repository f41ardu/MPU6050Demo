// require myMPU6050Demo3Kalman_2 configured on an Arduino (see Arduino) 
// thr-# 15.12.2016
void serialEvent(Serial myPort) {
  float ax_off,ay_off,az_off; 
  interval = millis();
  while (myPort.available() > 0) {
    String inBuffer = myPort.readStringUntil(linefeed);
    if (inBuffer != null) {
      msg = split(inBuffer, ',');
      println(inBuffer);
      if (msg.length == 7) {
        for (int i=0; i<7; i++ ) {
          value[i]=float (msg[i]);
        }
        for (int i=3; i<6; i++ ) {
         value[i]=0.0; //float (msg[i]);
          a_off[i-3] =+ value[i-3];
         }
        
        ax_off = a_off[2]/count; 
        ay_off = a_off[0]/count; 
        az_off = a_off[1]/count; 
        count++; 
        println(ax_off +"," + ay_off +"," + az_off);
        // value[5]=value[5];
        // arduino liefert ms
        deltaTime=abs(value[6]-timePrev);
        timePrev=value[6];
      }
    }
  }
}