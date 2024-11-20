library verilog;
use verilog.vl_types.all;
entity sevenseg is
    port(
        sw              : in     vl_logic_vector(3 downto 0);
        sevenseg        : out    vl_logic_vector(6 downto 0)
    );
end sevenseg;
