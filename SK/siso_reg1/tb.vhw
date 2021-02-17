--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : tb.vhw
-- /___/   /\     Timestamp : Wed Feb 17 23:50:31 2021
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tb
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE testbench_arch OF tb IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT siso_reg1
        PORT (
            CLK : In std_logic;
            PRE_SET : In std_logic;
            CLEAR : In std_logic;
            SI : In std_logic;
            SO : Out std_logic
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL PRE_SET : std_logic := '0';
    SIGNAL CLEAR : std_logic := '0';
    SIGNAL SI : std_logic := '0';
    SIGNAL SO : std_logic := '0';

    constant PERIOD : time := 36 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : siso_reg1
        PORT MAP (
            CLK => CLK,
            PRE_SET => PRE_SET,
            CLEAR => CLEAR,
            SI => SI,
            SO => SO
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  13ns
                WAIT FOR 13 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  49ns
                WAIT FOR 36 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  85ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  157ns
                WAIT FOR 72 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  193ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  301ns
                WAIT FOR 108 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  337ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  481ns
                WAIT FOR 144 ns;
                CLEAR <= '1';
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  517ns
                WAIT FOR 36 ns;
                CLEAR <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  553ns
                WAIT FOR 36 ns;
                PRE_SET <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  589ns
                WAIT FOR 36 ns;
                PRE_SET <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  625ns
                WAIT FOR 36 ns;
                CLEAR <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  661ns
                WAIT FOR 36 ns;
                CLEAR <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  697ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  769ns
                WAIT FOR 72 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  805ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  841ns
                WAIT FOR 36 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  877ns
                WAIT FOR 36 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  913ns
                WAIT FOR 36 ns;
                SI <= '0';
                -- -------------------------------------
                WAIT FOR 123 ns;

            END PROCESS;

    END testbench_arch;

