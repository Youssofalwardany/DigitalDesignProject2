module mux_4x1(input  [3:0] a, b, c, d, input  [2:0] sel, output reg [3:0]y);
    always @(sel or a or b or c or d)
        case (sel)
            0: y = a;
           1: y = b;
           2: y = c;
            3: y = d;
            default: y = a;
        endcase
endmodule //here we are going to



module jk_flipflop(input wire j, k, clk,input buttonleft,input buttonright, reset, output reg q);

    always @(buttonright or buttonleft or reset) begin
        if (reset)
            q <= 1'b0;
        else begin
   //this is always 0. i think not sent correct
            if (j && k)
                q <= ~q;
            else if (j)
                q <= 1'b1;
            else if (k)
                q <= 1'b0;
         
        end
    end

endmodule

module upordown_counter(
    active,
    reset,
    UpOrDown,  //high for UP counter and low for Down counter
    Count
    );

   
    //input ports and their sizes
    input active,reset;
    input UpOrDown;
    //output ports and their size
    output reg [2 : 0] Count;
    //Internal variables
   
     always @(posedge(active) or posedge(reset))
     begin
        if(reset == 1)
            Count <= 0;
        else    
            if(UpOrDown == 1)   //Up mode selected
                if(Count == 3)
                    Count = 0;
                else
                    Count <= Count + 1; //Incremend Counter
            else //Down mode selected
                if(Count == 0)
                    Count = 3;
                else
                    Count = Count - 1; //Decrement counter
     end    
   
endmodule

module scroller(input buttonleft,input buttonright, input [3:0] a, input [3:0]b, input [3:0]c, input [3:0]d, input [3:0]e, output  [3:0] x, output  [3:0]y, output  [3:0]z,output [2:0]count, input reset);

//input xx,xy,yx,yy,xz;
wire [1:0]dirct;


assign dirct = ~buttonleft;
       


//wire [1:0] count;


wire activate = buttonright | buttonleft;
upordown_counter udc_inst (
  .active(activate),
  .reset(reset),
  .UpOrDown(dirct),
  .Count(count)
);
//count={q1,q0};
mux_4x1 mux1(.a(c),.b(b),.c(a),.d(0),.sel(count),.y(x));
mux_4x1 mux2(.a(d),.b(c),.c(b),.d(0),.sel(count),.y(y));
mux_4x1 mux3(.a(e),.b(d),.c(c),.d(0),.sel(count),.y(z));




//HERE we assign the y,y2,y3,y4 to the 7segment display output


endmodule
