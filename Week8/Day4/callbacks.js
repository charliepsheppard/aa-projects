class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let date = new Date();
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();
    setInterval(() => {
      this._tick();
    }, 1000);
    
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hour}:${this.minute}:${this.second}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.second += 1;

    if (this.second > 59 ) {
      this.minute += 1
      this.second = 0
    }
    if (this.minute > 59) {
      this.hour += 1
      this.minute = 0
    }

    if (this.hour === 24){
      this.hour = 0
      this.minute = 0
      this.second = 0
    }
    this.printTime()
  }
}

// const clock = new Clock();

  
  
  // sum = 0;

  //   nums.forEach ((num) => {
  //     console.log(num);
  //     sum += num;
  //     console.log(sum);
  //   })

  //   setTimeout(() => {
  //     callback(sum);
  //   }, 0);
    
