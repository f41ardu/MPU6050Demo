// simple distance integration, to simple I would say 
// assume that this need most improvement
// I start to look at 
// http://www.physics.udel.edu/~bnikolic/teaching/phys660/numerical_ode/ode.html   
// amongst others 
// thr-# 15.12.2016 

void position() {
  ac[0] = filter_X.update(value[3]/16348); // x 
  ac[1] = -filter_Y.update(value[4]/16348); // y
  ac[2] = filter_Z.update(value[5]/16348); // z
    
  for (i=0; i < 3; i++ ) {
   
  velocity[i] = v_n[i] + ac[i]*deltaTime; 
  pos[i] = pos[i] +  velocity[i] * deltaTime ; // + (0.5*ac[i])*(pow(deltaTime,2)); //  velocity[i]*deltaTime;                     
  v_n[i] =  ac[i] * deltaTime;
  //preVelocity[i] = velocity[i];      
  }       
// println(); 
}       