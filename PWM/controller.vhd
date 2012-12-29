LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller IS

	GENERIC(
		width :integer :=8
		);
	PORT(
		address :IN STD_LOGIC_VECTOR(1 downto 0);
		writedata :IN STD_LOGIC_VECTOR(width-1 downto 0);
		write :IN STD_LOGIC;
		chipselect :IN STD_LOGIC;
		clk :IN STD_LOGIC;
		reset_n :IN STD_LOGIC;
		cnt :IN STD_LOGIC_VECTOR(width-1 downto 0);
		upDown :IN STD_LOGIC;
		enable :OUT STD_LOGIC;
		coe_export_pwmOut :OUT STD_LOGIC
		);
END controller;

ARCHITECTURE behavior OF controller IS
	-- Maximum value the external counter can count to assuming same bit size
	CONSTANT max :STD_LOGIC_VECTOR(width-1 downto 0) := (others => '1');
	
	-- OCR value to trigger output changes
	SIGNAL ocr :STD_LOGIC_VECTOR(width-1 downto 0) := max;
	
	SIGNAL control :STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	SIGNAL output :STD_LOGIC := '1';
BEGIN
	PROCESS(clk, reset_n)
	BEGIN
		-- Do work on rising edge of clock
		IF clk'EVENT AND clk = '1' THEN
			enable <= control(7);
			IF reset_n = '0' THEN
				ocr <= max;
				coe_export_pwmOut <= '1';
				control <= (others => '0');
			-- Conditions are met to write to OCR
			ELSIF write = '1' AND address = "01" AND chipselect = '1' THEN
				-- Write to OCR
				ocr <= writedata;
			ELSIF write = '1' AND address = "00" AND chipselect = '1' THEN
				-- Write to control register
				control <= writedata;
			ELSIF control(7) = '0' THEN
				output <= '0';
				coe_export_pwmOut <= '0';
			-- OCR = TCNT and up counting
			ELSIF cnt = ocr AND upDown = '0' THEN
				-- Clear output
				coe_export_pwmOut <= '0';
				output <= '0';
			-- OCR = TCNT and down counting
			ELSIF cnt = ocr AND upDown = '1' THEN
				-- Set output
				coe_export_pwmOut <= '1';
				output <= '1';
			-- Still just counting, no need to change
			ELSE
				-- Just output previous output value
				coe_export_pwmOut <= output;
			END IF;
		END IF;
	END PROCESS;
END behavior;