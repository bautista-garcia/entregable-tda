library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Utils.all;
entity test_multiplicador is
end test_multiplicador;

architecture test of test_multiplicador is

    component multiplicador
        port (
            CLK    : in  BIT;
            CLR    : in  BIT;
            STB    : in  BIT;
            A, B   : in  BIT_VECTOR(3 downto 0);
            Result : out BIT_VECTOR(7 downto 0);
            Done   : out BIT	   
			
			-- Senales de debugging
			--add_deb: out BIT;
			--shift_out: out BIT;
			--stop_out: out BIT;
			--srb_out: out BIT_VECTOR (7 downto 0);
			--sraa_out: out BIT_VECTOR (7 downto 0);
			--acc_out: out BIT_VECTOR (7 downto 0)
        );
    end component;

    -- Senales conectadas a DUT
    signal CLK    : BIT := '0';
    signal CLR    : BIT := '0';
    signal STB    : BIT := '0';
    signal A      : BIT_VECTOR(3 downto 0);
    signal B      : BIT_VECTOR(3 downto 0);
    signal Result : BIT_VECTOR(7 downto 0);
    signal Done   : BIT;		
	
	--- Senales de debugging
	--signal add_deb : BIT;
	--signal shift_out: BIT;
	--signal stop_out: BIT;	
	--signal srb_out : BIT_VECTOR(7 downto 0);	
	--signal sraa_out :  BIT_VECTOR(7 downto 0);
	--signal acc_out :  BIT_VECTOR(7 downto 0);	  
	
    -- Calculo a partir del legajo explicito en informe
    constant CLK_PERIOD : time := 16 ns; -- El resultado es de 15.62ns redondeo en 16ns

begin

    -- Instancia del componente Multiplicador
    UUT: multiplicador
        port map (
            CLK    => CLK,
            CLR    => CLR,
            STB    => STB,
            A      => A,
            B      => B,
            Result => Result,
            Done   => Done	
			
			-- Senales de debugging
			--add_deb => add_deb,
			--shift_out => shift_out,
			--stop_out => stop_out,
			--sraa_out => sraa_out,
			--srb_out => srb_out,
			--acc_out => acc_out
        );

    -- CLK con utils P8
    CLK_gen: process
    begin
        Clock(CLK, CLK_PERIOD/2, CLK_PERIOD/2);
    end process;

 
    Stimulus: process	
		variable A_int : Natural := 2;  
        variable B_int : Natural := 9;  	
    begin
        -- Reset inicial
        CLR <= '1';
        STB <= '0';
        wait for 20 ns;
        CLR <= '0';

        -- Conversion con utils P8
        A <= Convert(A_int, 4); 
        B <= Convert(B_int, 4);  
		
		
		-- Senal de inicio > periodo de CLK
        STB <= '1';
        wait for 17 ns;
        STB <= '0';

        -- Espera a que se complete la operación
        wait until Done = '1';	
		

        -- Verificación del resultado esperado (9 * 2 = 18 = "00010010" en binario)
        assert Result = "00010010"
        report "Error: Resultado incorrecto"
        severity failure;

        wait;
    end process;

end test;