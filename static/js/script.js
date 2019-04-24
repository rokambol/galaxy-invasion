
//sort bars based on value
        data = data().sort(function (a, b) {
            return d3.ascending(a.value, b.value);
        });
// global variables
        //set up svg using margin conventions -need plenty of room on the left for labels
        var margin = {
            top: 1,
            right: 25,
            bottom: 15,
            left: 100
        };

        var width = 960 - margin.left - margin.right,
            height = 500 - margin.top - margin.bottom;

// First bar chart
        var svg = d3.select("#graphic")
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        var x = d3.scale.linear()
            .range([0, width])
            .domain([0, d3.max(data, function (d) {
                return (d.dist_from_sun)* 0.9;
            })]);

        var y = d3.scale.ordinal()
            .rangeRoundBands([height, 0], .1)
            .domain(data.map(function (d) {
                return d.name;
            }));

        //make y axis to show bar names
        var yAxis = d3.svg.axis()
            .scale(y)
            //no tick marks
            .tickSize(0)
            .orient("left");

        var gy = svg.append("g")
            .attr("class", "y axis")
            .call(yAxis);

        var bars = svg.selectAll(".bar")
            .data(data)
            .enter()
            .append("g")

        //append rects
        bars.append("rect")
            .attr("class", "bar")
            .attr("y", function (d) {
                return y(d.name);
            })
            .attr("height", y.rangeBand())
            .attr("x", 0)
            .attr("width", function (d) {
                return x(d.dist_from_sun);
            });

        //add a value label to the right of each bar
        bars.append("text")
            .attr("class", "label")
            //y position of the label is halfway down the bar
            .attr("y", function (d) {
                return y(d.name) + y.rangeBand() / 2 + 4;
            })
            //x position is 3 pixels to the right of the bar
            .attr("x", function (d) {
                return x(d.dist_from_sun) / 2;
            })
            .text(function (d) {
                return d.dist_from_sun;
            });
            
            

                
            
///////////////////////////////////////////

// second chart - circle 
var w = 960;
var h = 500

var svg = d3.select('#circles')
.append('svg')
.attr('width', w)
.attr('height', h)
.attr('class','radSol')
.append("g")
.attr("transform", "translate(" + (margin.left - 70) + "," + margin.top + ")");


var rscale = d3.scale.linear()

svg.selectAll('.circles')
.data(data)
.enter()
.append('circle')

.attr('r', function(d){
  return (Math.floor(d.diameter/1000)/2.9);
})
.attr('class','circles')
.attr('cy', h/2.2)
.attr('cx',function(d,i){
//  console.log(i)
  return 20 +109*i;
});


svg.selectAll('text')
.data(data)
.enter()
.append('text')
.text(function(d){
  console.log(this);
  return d.name;
})
.attr('font-size', 10)
.attr('fill', 'blue')
.attr('x', function(d,i){
  return 20 +109*i;
})
.attr('y', h/3)
.attr('text-anchor', 'middle');

////////////////////////////////////////////////////////////////////

 var margin = {"top": 20, "right": 10, "bottom": 20, "left": 30 }
    var width = 500;
    var height = 500;
    var rectWidth = 100;
    
    
    // scales
    var xMax = 5 * rectWidth;
    var xScale = d3.scaleLinear()
    	.domain([0, xMax])
    	.range([margin.left, width - margin.right]);
    var yMax = d3.max(data.moons, function(d){return d[0]});
    var yScale = d3.scaleLinear()
    	.domain([0, yMax])
    	.range([height - margin.bottom, margin.top]);
     
    // svg element
    var svg = d3.select('#horizontal');
		
    // bars 
    var rect = svg.selectAll('rect')
    	.data(data.moons)
    	.enter()
    	.append('rect')
    	.attr('x', function(d, i){ 
        return xScale(i * rectWidth)})
    	.attr('y', function(d){
        return yScale(d[0])})
    	.attr('width', xScale(rectWidth) - margin.left)
    	.attr('height', function(d){
        return height - margin.bottom - yScale(d[0])})
			.attr('fill', function(d){
        return d[1]})
    	.attr('margin', 0);
    
    // axes
    var xAxis = d3.axisBottom()
    	.scale(xScale)
    	.tickFormat(d3.format('d'));
    var yAxis = d3.axisLeft()
    	.scale(yScale)
    	.tickFormat(d3.format('d'));
    
    svg.append('g')
      	.attr('transform', 'translate(' + [0, height - margin.bottom] + ')')
      	.call(xAxis);
      svg.append('g')
      	.attr('transform', 'translate(' + [margin.left, 0] + ')')
      	.call(yAxis);
























//d3.select('#circles').append('html:br')



// Also not really useful example I guess but I think I mae it so the areas are proportional to d. Need to check the results. http://chimera.labs.oreilly.com/books/1230000000345/ch06.html#_size
//var twos = d3.select('#graphic1').append('svg').attr('width', w).attr('height', h).attr('class','radArea');




//twos.selectAll('.circles')
//.data(circs)
//.enter()
//.append('circle')

//.attr('r', function(d){

  // Multiplying the value by 4 is mucking up the result area maybe but the results might be proportional to data w/out it
 // return (Math.sqrt(d *4/Math.PI));
//})
//.attr('class','circles')
//.attr('cy', h/2)
//.attr('cx',function(d,i){
 // console.log(i)
 // return 20+40 *i
//})


/*twos.selectAll('text')
.data(circs).enter().append('text')
.text(function(d){
  console.log(this);
  var circRad = (Math.sqrt(d *4/Math.PI));
  return Math.round((circRad * circRad)*Math.PI)

})
.attr('font-size', 10)
.attr('fill', 'pink')
.attr('x', function(d,i){
  return 20 +40*i
})
.attr('y', h/4)
.attr('text-anchor', 'middle')



d3.select('body').append('html:br')


// this part is drawn from http://chimera.labs.oreilly.com/books/1230000000345/ch07.html#_refining_the_plot
var threes = d3.select('body').append('svg').attr('width', w).attr('height', h).attr('class','radLin');

var rscale = d3.scale.linear()
  .domain([0,d3.max(circs)])
  .range([3,20])


threes.selectAll('.circles').data(circs)
.enter()
.append('circle')

.attr('r', function(d){
  return rscale(d);
})
.attr('class','circles')
.attr('cy', h/2)
.attr('cx',function(d,i){
//  console.log(i)
  return 20+40 *i
})

threes.selectAll('text')
.data(circs).enter().append('text')
.text(function(d){
  console.log(this);
  var circRad = rscale(d);
  return Math.round((circRad * circRad)*Math.PI)

})
.attr('font-size', 10)
.attr('fill', 'brown')
.attr('x', function(d,i){
  return 20 +40*i
})
.attr('y', h/4)
.attr('text-anchor', 'middle')*/