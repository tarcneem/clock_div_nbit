
module clock_div_nbit 
    // Parameters section
    #( parameter CNT_WIDTH = 4)
    // Ports section
    (input clk,
    input reset_n,
	output reg clk_div2,
    output [CNT_WIDTH-1:0] counter // only a net
	); 
  
    // Make a separate divider by two
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
		    clk_div2 <= 0;
		else
		    clk_div2 <= ~clk_div2; // feedback loop
    end 
	
	// Instantiate a parameterizable module 
	// with a new parameter value
    counter_nbit 
        #(.CNT_WIDTH(CNT_WIDTH))
		    CNT_NBIT0
        (.clk    (clk    ),
         .reset_n(reset_n),
         .counter(counter)
		);
  
endmodule
