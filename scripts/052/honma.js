for (var i = 123456 ; i <= 166666 ; i++) {
  var sort_num = i.toString().split('').sort().toString();
  if ((2 * i).toString().split('').sort().toString() == sort_num &&
      (3 * i).toString().split('').sort().toString() == sort_num &&
      (4 * i).toString().split('').sort().toString() == sort_num &&
      (5 * i).toString().split('').sort().toString() == sort_num &&
      (6 * i).toString().split('').sort().toString() == sort_num ){
        console.log(i);
        break;
      }
}
