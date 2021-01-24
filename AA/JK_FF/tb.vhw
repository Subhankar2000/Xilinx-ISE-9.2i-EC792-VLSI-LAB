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
-- /___/   /\     Timestamp : Mon Jan 25 00:08:14 2021
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
    COMPONENT JKFF
        PORT (
            CLK : In std_logic;
            J : In std_logic;
            K : In std_logic;
            Q : InOut std_logic;
            Q_BAR : InOut std_logic
        );
    END COMPONENT;

    SIGNAL CLK : std_logic := '0';
    SIGNAL J : std_logic := '0';
    SIGNAL K : std_logic := '0';
    SIGNAL Q : std_logic := '0';
    SIGNAL Q_BAR : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : JKFF
        PORT MAP (
            CLK => CLK,
            J => J,
            K => K,
            Q => Q,
            Q_BAR => Q_BAR
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
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                K <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                J <= '1';
                K <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                J <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                K <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  885ns
                WAIT FOR 200 ns;
                K <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1085ns
                WAIT FOR 200 ns;
                J <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1285ns
                WAIT FOR 200 ns;
                J <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1485ns
                WAIT FOR 200 ns;
                K <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1685ns
                WAIT FOR 200 ns;
                K <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1885ns
                WAIT FOR 200 ns;
                J <= '1';
                K <= '1';
                -- -------------------------------------
                WAIT FOR 1315 ns;

            END PROCESS;

    END testbench_arch;

