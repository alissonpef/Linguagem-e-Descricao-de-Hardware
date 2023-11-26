module c_barramento(
 clk, 
 reset,  data_valid, data,  data_read );

	input wire clk;
	input wire reset;
	input wire data_valid;
	input wire [7:0]data;
	output reg data_read;
	
	
	
	// Constants and variables
	localparam integer WAITING = 0,
	STATE1 = 1,
	STATE2 = 2,
	STATE3 = 3;
	reg [7:0] local_buffer;
	reg [1:0] read_state;
	//reg data_read;
	
	
	// state variables - sequential
	always @(posedge clk or posedge reset) begin
		if (reset == 1) begin // async reset logic
			read_state <= WAITING;
			local_buffer <= 8'h0;
		end
		else begin
			case (read_state)
			WAITING: if (data_valid) read_state <= STATE1; 
			STATE1 : begin 
				read_state <= STATE2;
				local_buffer <= data;
			end
			STATE2 : read_state <= STATE3;
			STATE3 : if (!data_valid) read_state <= WAITING;
			endcase
		end
	end
	
// output decode - combinational
	always @(read_state) begin
		case (read_state)
			STATE1 : data_read = 1'b1;
			STATE2 : data_read = 1'b1;
			default : data_read = 1'b0;
		endcase
	end
endmodule
