library verilog;
use verilog.vl_types.all;
entity ALU2Schematic is
    port(
        R1              : out    vl_logic_vector(0 to 6);
        Clock           : in     vl_logic;
        reset_Latch     : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        En              : in     vl_logic;
        data_in         : in     vl_logic;
        reset           : in     vl_logic;
        R1R1            : out    vl_logic_vector(3 downto 0);
        R2              : out    vl_logic_vector(0 to 6);
        R2R2            : out    vl_logic_vector(3 downto 0);
        sID             : out    vl_logic_vector(0 to 6);
        SIGN_R1         : out    vl_logic_vector(0 to 6)
    );
end ALU2Schematic;
