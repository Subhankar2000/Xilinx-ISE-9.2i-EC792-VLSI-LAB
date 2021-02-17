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
-- /___/   /\     Timestamp : Wed Feb 17 23:23:13 2021
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

    COMPONENT siso4
        PORT (
            SI : In std_logic;
            CLK : In std_logic;
            SO : Out std_logic;
            PRESET : In std_logic;
            CLEAR : In std_logic
        );
    END COMPONENT;

    SIGNAL SI : std_logic := '0';
    SIGNAL CLK : std_logic := '0';
    SIGNAL SO : std_logic := '0';
    SIGNAL PRESET : std_logic := '0';
    SIGNAL CLEAR : std_logic := '0';

    constant PERIOD : time := 32 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : siso4
        PORT MAP (
            SI => SI,
            CLK => CLK,
            SO => SO,
            PRESET => PRESET,
            CLEAR => CLEAR
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
                -- -------------  Current Time:  11ns
                WAIT FOR 11 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  43ns
                WAIT FOR 32 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  75ns
                WAIT FOR 32 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  139ns
                WAIT FOR 64 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  171ns
                WAIT FOR 32 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  267ns
                WAIT FOR 96 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  299ns
                WAIT FOR 32 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  427ns
                WAIT FOR 128 ns;
                SI <= '0';
                CLEAR <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  459ns
                WAIT FOR 32 ns;
                CLEAR <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  491ns
                WAIT FOR 32 ns;
                PRESET <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  523ns
                WAIT FOR 32 ns;
                PRESET <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  555ns
                WAIT FOR 32 ns;
                CLEAR <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  587ns
                WAIT FOR 32 ns;
                PRESET <= '1';
                CLEAR <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  651ns
                WAIT FOR 64 ns;
                PRESET <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  715ns
                WAIT FOR 64 ns;
                CLEAR <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  747ns
                WAIT FOR 32 ns;
                SI <= '1';
                CLEAR <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  779ns
                WAIT FOR 32 ns;
                SI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  811ns
                WAIT FOR 32 ns;
                SI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  875ns
                WAIT FOR 64 ns;
                SI <= '0';
                -- -------------------------------------
                WAIT FOR 157 ns;

            END PROCESS;

    END testbench_arch;

