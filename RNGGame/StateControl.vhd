-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- Generated by Quartus II Version 12.1 Build 177 11/07/2012 SJ Web Edition
-- Created on Thu Dec 15 12:47:51 2016

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY StateControl IS
    PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        SixtySeconds : IN STD_LOGIC := '0';
        FiveSeconds : IN STD_LOGIC := '0';
        OneSeconds : IN STD_LOGIC := '0';
        AnswerCompare : IN STD_LOGIC := '0';
        LessThan6 : IN STD_LOGIC := '0';
        LessThan13 : IN STD_LOGIC := '0';
        LessThan20 : IN STD_LOGIC := '0';
        GreaterThan20 : IN STD_LOGIC := '0';
        Key3 : IN STD_LOGIC := '0';
        RNG_EN : OUT STD_LOGIC;
        RNG_PRE : OUT STD_LOGIC;
        RNG_CLR : OUT STD_LOGIC;
        SixtySecEN : OUT STD_LOGIC;
        SixtySecCLR : OUT STD_LOGIC;
        FiveSecEN : OUT STD_LOGIC;
        FiveSecCLR : OUT STD_LOGIC;
        OneSecEN : OUT STD_LOGIC;
        OneSecCLR : OUT STD_LOGIC;
        DisplayQuesEN : OUT STD_LOGIC;
        DisplayCorrectEN : OUT STD_LOGIC;
        DisplayIncorrectEN : OUT STD_LOGIC;
        GoodScore : OUT STD_LOGIC;
        YeahScore : OUT STD_LOGIC;
        UhohScore : OUT STD_LOGIC;
        SosoScore : OUT STD_LOGIC;
        StoreUserEN : OUT STD_LOGIC;
        StoreUserCLR : OUT STD_LOGIC;
        AdderEN : OUT STD_LOGIC;
        AdderCLR : OUT STD_LOGIC;
        ScoreADD : OUT STD_LOGIC;
        ScoreCLR : OUT STD_LOGIC;
        LoadSixty : OUT STD_LOGIC
    );
END StateControl;

ARCHITECTURE BEHAVIOR OF StateControl IS
    TYPE type_fstate IS (NotReady,NewNumber,Play,AddScore,Correct,Incorrect,GameOver,Add);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reset,reg_fstate)
    BEGIN
        IF (reset='0') THEN
            fstate <= NotReady;
        ELSIF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,SixtySeconds,FiveSeconds,OneSeconds,AnswerCompare,LessThan6,LessThan13,LessThan20,GreaterThan20,Key3)
    BEGIN
        RNG_EN <= '0';
        RNG_PRE <= '0';
        RNG_CLR <= '0';
        SixtySecEN <= '0';
        SixtySecCLR <= '0';
        FiveSecEN <= '0';
        FiveSecCLR <= '0';
        OneSecEN <= '0';
        OneSecCLR <= '0';
        DisplayQuesEN <= '0';
        DisplayCorrectEN <= '0';
        DisplayIncorrectEN <= '0';
        GoodScore <= '0';
        YeahScore <= '0';
        UhohScore <= '0';
        SosoScore <= '0';
        StoreUserEN <= '0';
        StoreUserCLR <= '0';
        AdderEN <= '0';
        AdderCLR <= '0';
        ScoreADD <= '0';
        ScoreCLR <= '0';
        LoadSixty <= '0';
        CASE fstate IS
            WHEN NotReady =>
                reg_fstate <= NewNumber;

                LoadSixty <= '1';

                ScoreCLR <= '1';

                ScoreADD <= '0';

                AdderCLR <= '1';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '0';

                OneSecCLR <= '1';

                OneSecEN <= '0';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '1';

                SixtySecEN <= '0';

                RNG_CLR <= '1';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN NewNumber =>
                IF ((SixtySeconds = '1')) THEN
                    reg_fstate <= GameOver;
                ELSIF (NOT((SixtySeconds = '1'))) THEN
                    reg_fstate <= Add;
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= NewNumber;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '0';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '1';

                OneSecCLR <= '1';

                OneSecEN <= '0';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '1';
            WHEN Play =>
                IF ((((FiveSeconds = '1') AND NOT((SixtySeconds = '1'))) OR (((NOT((SixtySeconds = '1')) AND NOT((FiveSeconds = '1'))) AND NOT((AnswerCompare = '1'))) AND NOT((Key3 = '1'))))) THEN
                    reg_fstate <= Incorrect;
                ELSIF ((((NOT((SixtySeconds = '1')) AND NOT((FiveSeconds = '1'))) AND (AnswerCompare = '1')) AND NOT((Key3 = '1')))) THEN
                    reg_fstate <= AddScore;
                ELSIF ((SixtySeconds = '1')) THEN
                    reg_fstate <= GameOver;
                ELSE
                    reg_fstate <= Play;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '0';

                AdderEN <= '0';

                StoreUserCLR <= '0';

                StoreUserEN <= '1';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '1';

                OneSecCLR <= '1';

                OneSecEN <= '0';

                FiveSecCLR <= '0';

                FiveSecEN <= '1';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN AddScore =>
                IF (NOT((SixtySeconds = '1'))) THEN
                    reg_fstate <= Correct;
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= AddScore;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '1';

                AdderCLR <= '0';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '1';

                DisplayQuesEN <= '0';

                OneSecCLR <= '0';

                OneSecEN <= '1';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN Correct =>
                IF (((OneSeconds = '1') AND NOT((SixtySeconds = '1')))) THEN
                    reg_fstate <= NewNumber;
                ELSIF ((SixtySeconds = '1')) THEN
                    reg_fstate <= GameOver;
                ELSE
                    reg_fstate <= Correct;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '0';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '1';

                DisplayQuesEN <= '0';

                OneSecCLR <= '0';

                OneSecEN <= '1';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN Incorrect =>
                IF (((OneSeconds = '1') AND NOT((SixtySeconds = '1')))) THEN
                    reg_fstate <= NewNumber;
                ELSIF ((SixtySeconds = '1')) THEN
                    reg_fstate <= GameOver;
                ELSE
                    reg_fstate <= Incorrect;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '0';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '1';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '0';

                OneSecCLR <= '0';

                OneSecEN <= '1';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN GameOver =>
                reg_fstate <= GameOver;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '1';

                AdderEN <= '0';

                StoreUserCLR <= '1';

                StoreUserEN <= '0';

                IF (((LessThan13 = '1') AND ((NOT((LessThan6 = '1')) AND NOT((LessThan20 = '1'))) AND NOT((GreaterThan20 = '1'))))) THEN
                    SosoScore <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    SosoScore <= '0';
                END IF;

                IF (((LessThan6 = '1') AND ((NOT((LessThan20 = '1')) AND NOT((LessThan13 = '1'))) AND NOT((GreaterThan20 = '1'))))) THEN
                    UhohScore <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    UhohScore <= '0';
                END IF;

                IF (((GreaterThan20 = '1') AND ((NOT((LessThan6 = '1')) AND NOT((LessThan13 = '1'))) AND NOT((LessThan20 = '1'))))) THEN
                    YeahScore <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    YeahScore <= '0';
                END IF;

                IF (((LessThan20 = '1') AND ((NOT((LessThan6 = '1')) AND NOT((LessThan13 = '1'))) AND NOT((GreaterThan20 = '1'))))) THEN
                    GoodScore <= '1';
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    GoodScore <= '0';
                END IF;

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '0';

                OneSecCLR <= '1';

                OneSecEN <= '0';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '1';

                SixtySecEN <= '0';

                RNG_CLR <= '1';

                RNG_PRE <= '0';

                RNG_EN <= '0';
            WHEN Add =>
                IF (NOT((SixtySeconds = '1'))) THEN
                    reg_fstate <= Play;
                ELSIF ((SixtySeconds = '1')) THEN
                    reg_fstate <= GameOver;
                -- Inserting 'else' block to prevent latch inference
                ELSE
                    reg_fstate <= Add;
                END IF;

                LoadSixty <= '0';

                ScoreCLR <= '0';

                ScoreADD <= '0';

                AdderCLR <= '0';

                AdderEN <= '1';

                StoreUserCLR <= '0';

                StoreUserEN <= '0';

                SosoScore <= '0';

                UhohScore <= '0';

                YeahScore <= '0';

                GoodScore <= '0';

                DisplayIncorrectEN <= '0';

                DisplayCorrectEN <= '0';

                DisplayQuesEN <= '1';

                OneSecCLR <= '1';

                OneSecEN <= '0';

                FiveSecCLR <= '1';

                FiveSecEN <= '0';

                SixtySecCLR <= '0';

                SixtySecEN <= '1';

                RNG_CLR <= '0';

                RNG_PRE <= '1';

                RNG_EN <= '0';
            WHEN OTHERS => 
                RNG_EN <= 'X';
                RNG_PRE <= 'X';
                RNG_CLR <= 'X';
                SixtySecEN <= 'X';
                SixtySecCLR <= 'X';
                FiveSecEN <= 'X';
                FiveSecCLR <= 'X';
                OneSecEN <= 'X';
                OneSecCLR <= 'X';
                DisplayQuesEN <= 'X';
                DisplayCorrectEN <= 'X';
                DisplayIncorrectEN <= 'X';
                GoodScore <= 'X';
                YeahScore <= 'X';
                UhohScore <= 'X';
                SosoScore <= 'X';
                StoreUserEN <= 'X';
                StoreUserCLR <= 'X';
                AdderEN <= 'X';
                AdderCLR <= 'X';
                ScoreADD <= 'X';
                ScoreCLR <= 'X';
                LoadSixty <= 'X';
                report "Reach undefined state";
        END CASE;
    END PROCESS;
END BEHAVIOR;
