var conversionApp = new Vue({
  el:'#conversion',
  data: {
    outputData1: [],
	outputData2: [],
	outputData3: [],
	outputData4: [],
	outputData5: [],
	outputData6: [],
	outputData7: [],

  },
  methods: {
	ltrim(str) {
		if(str == null) return str;
		return str.replace(/^\s+/g, '');
	},
    loadedFiles(event) {
      console.log(event.target.files);
	  theFiles = event.target.files
	  
	  for(let i = 0; i<theFiles.length; i++) {
		let reader = new FileReader()
	    reader.onload = this.handleEvent
		reader.readAsText(theFiles[i])
	  }

	  
	  //var i = reader.readAsText(theFiles[0])
	  //test = reader.result
	  //var test = reader.readAsText(theFiles[0])
	  //console.log(reader.result)
	  
   },
   handleEvent(event) {
	test = event.target.result.split(/\r?\n/)
	test.pop()
	console.log(test)
	
	for(let i = 0; i<test.length; i++) { 
		test[i] = test[i].split(':')
		test[i] = this.ltrim(test[i][1])
		if (test[i] === "" || test[i] === " ") {
		  test[i] = 'null'	
		}
    } 
	console.log(test)
	// DEVICE
	var valueOne = test.slice(2,3)
	var resultOne = valueOne.concat(test.slice(46,47), test.slice(50,59))
	console.log(resultOne)
	this.outputData1.push(resultOne)
	
	//INSTALLER
	
	var resultTwo = test.slice(0,1)
	console.log(resultTwo)
	this.outputData2.push(resultTwo)
	
	//LOCATION
	
	var resultThree = test.slice(47,50)
	console.log(resultThree)
	this.outputData3.push(resultThree)
	
	//Vodaphone
	
	var valueFour = test.slice(5,7)
	var resultFour = valueFour.concat(test.slice(10,12), test.slice(15,17), test.slice(20,22), test.slice(31,33), test.slice(36,38), test.slice(41,43))
	console.log(resultFour)
	this.outputData4.push(resultFour)
	
	//Telstra
	
	var valueFive = test.slice(7,9)
	var resultFive = valueFive.concat(test.slice(12,14), test.slice(17,19), test.slice(22,24), test.slice(33,35), test.slice(38,40), test.slice(43,45))
	console.log(resultFive)
	this.outputData5.push(resultFive)
	
	//External
	
	var valueSix = test.slice(9,10)
	var resultSix = valueSix.concat(test.slice(14,15), test.slice(19,20), test.slice(24,25), test.slice(35,36), test.slice(40,41), test.slice(45,46))
	console.log(resultSix)
	this.outputData6.push(resultSix)
	
	//Work order
	
	var valueSeven = test.slice(3,5)
	var resultSeven = valueSeven.concat(test.slice(25,31))
	console.log(resultSeven)
	this.outputData7.push(resultSeven)
	
	/*
	
	var finalString = ''
	var last_element = test.length - 1
	for(let i = 0; i<test.length; i++) { 
		finalString += test[i]
		if (last_element != i) {
			finalString += ','
		}
	}
	*/
	//console.log(finalString)
	//THINK ABOUT COMMAS INSIDE DATA
   },
   printingResult() {
	var finalOne = ''
	for(let i = 0; i<this.outputData7.length; i++) {
		var last_elementOne = this.outputData7[i].length - 1
	    for(let a = 0; a<this.outputData7[i].length; a++) {
			finalOne += this.outputData7[i][a]
			if (last_elementOne != a) {
				finalOne += '|'
			}
		}
	finalOne += "\n"
	}
	console.log(finalOne)
   }
  }
})
