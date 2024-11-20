module mux2x2(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire [3:0]c,
    input wire [3:0]d,
    input wire [1:0] sel,
    output reg [3:0]out
);


always@(a or b or c or d or sel)
begin
    if (sel == 2'b00) begin
        out = a;
    end 
    else if (sel == 2'b01) begin
        out = b;
    end
    else if (sel == 2'b10) begin
        out = c; 
    end 
    else if (sel == 2'b11)begin
        out = d;
    end
end

endmodule
