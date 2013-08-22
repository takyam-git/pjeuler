function a(b){c=0;while(b>1){c|=1<<(b%10);b=+(b/10)}return c}for(d=123455;++d;){e=a(++d);if(e===a(d+d)&&e===a(d*3)&&e===a(d*4)&&e===a(d*5)&&e===a(d*6)){break}}
console.log(d);