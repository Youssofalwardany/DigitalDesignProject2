// file: shiftleftregister.v
// author: @af3310

`timescale 1ns/1ns


module mux_4x1(input wire [3:0] a, b, c, d, input wire [1:0] sel, output reg y);
    always @(a, b, c, d, sel)
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
            default: y = 0;
        endcase
endmodule //here we are going to



module jk_flipflop(input wire j, k, clk, reset, output reg q);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else begin
            if (j && k)
                q <= ~q;
            else if (j)
                q <= 1'b1;
            else if (k)
                q <= 1'b0;
        end
    end

endmodule


module up_down_counter ( //mod 2 counter up_down_counter
  input wire clk,
  input wire reset,
  input wire up,
  input wire down,
  output reg [1:0] count
);

  reg j0, k0, j1, k1;
  
  wire q0, q1;

  jk_flipflop flipflop0 (.j(j0), .k(k0), .clk(clk), .reset(reset), .q(q0));
  jk_flipflop flipflop1 (.j(j1), .k(k1), .clk(clk), .reset(reset), .q(q1));

  always @(posedge clk) begin
    if (reset)
      count <= 2'b00;
    else begin
      j0 <= up & ~q0;
      k0 <= down & q0;

      j1 <= up & ~q1 & q0;
      k1 <= down & q1 & ~q0;

      count <= {q1, q0};
    end
  end

endmodule


module scroller(input buttonleft,input buttonright, output y ,output x,output z);

input xx,xy,yx,yy,xz;
reg clk, reset, up, down;
reg thebuttonactivation;
assign thebuttonactivation= buttonright or buttonleft; //check syntax / send this in as clock signal 
reg  x1;
assign x1= !buttonright;
assign up= x1;//change 



wire [1:0] count;
reg [3:0] a, b, c, d,a2,b2,c2,d2,a3,b3,c3,d3;
reg [1:0] sel,sel2,sel3,sel4;
wire y,y2,y3,y4;
  
up_down_counter(.clk(clk),.reset(reset),.up(up),.down(down),.count(count));
mux_4x1(.a(a),.b(b),.c(c),.d(d),.sel(sel),.y(y));
mux_4x1(.a(a2),.b(b2),.c(c2),.d(d2),.sel(sel2),.y(y2));
mux_4x1(.a(a3),.b(b3),.c(c3),.d(d3),.sel(sel3),.y(y3));

//HERE we assign the y,y2,y3,y4 to the 7segment display output


endmodule

