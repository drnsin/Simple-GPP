library verilog;
use verilog.vl_types.all;
entity ALU2Schematic_vlg_check_tst is
    port(
        R1              : in     vl_logic_vector(0 to 6);
        R1R1            : in     vl_logic_vector(3 downto 0);
        R2              : in     vl_logic_vector(0 to 6);
        R2R2            : in     vl_logic_vector(3 downto 0);
        sID             : in     vl_logic_vector(0 to 6);
        SIGN_R1         : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end ALU2Schematic_vlg_check_tst;
