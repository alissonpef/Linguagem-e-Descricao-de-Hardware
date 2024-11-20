library verilog;
use verilog.vl_types.all;
entity cronometro is
    port(
        clkin           : in     vl_logic;
        reset           : in     vl_logic;
        hold            : in     vl_logic;
        disp1           : out    vl_logic_vector(6 downto 0);
        disp2           : out    vl_logic_vector(6 downto 0);
        disp3           : out    vl_logic_vector(6 downto 0);
        disp4           : out    vl_logic_vector(6 downto 0)
    );
end cronometro;
