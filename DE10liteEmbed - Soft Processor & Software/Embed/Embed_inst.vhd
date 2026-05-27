	component Embed is
		port (
			altpll_1_areset_conduit_export      : in    std_logic                     := 'X';             -- export
			altpll_1_locked_conduit_export      : out   std_logic;                                        -- export
			clk_clk                             : in    std_logic                     := 'X';             -- clk
			clk_0_clk                           : in    std_logic                     := 'X';             -- clk
			dram_clk_clk                        : out   std_logic;                                        -- clk
			gsensor_MISO                        : in    std_logic                     := 'X';             -- MISO
			gsensor_MOSI                        : out   std_logic;                                        -- MOSI
			gsensor_SCLK                        : out   std_logic;                                        -- SCLK
			gsensor_SS_n                        : out   std_logic;                                        -- SS_n
			ledr_export                         : out   std_logic_vector(9 downto 0);                     -- export
			modular_adc_0_adc_pll_locked_export : in    std_logic                     := 'X';             -- export
			reset_reset_n                       : in    std_logic                     := 'X';             -- reset_n
			reset_0_reset_n                     : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                          : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                            : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                         : out   std_logic;                                        -- cas_n
			sdram_cke                           : out   std_logic;                                        -- cke
			sdram_cs_n                          : out   std_logic;                                        -- cs_n
			sdram_dq                            : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm                           : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n                         : out   std_logic;                                        -- ras_n
			sdram_we_n                          : out   std_logic;                                        -- we_n
			sw_export                           : in    std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component Embed;

	u0 : component Embed
		port map (
			altpll_1_areset_conduit_export      => CONNECTED_TO_altpll_1_areset_conduit_export,      --      altpll_1_areset_conduit.export
			altpll_1_locked_conduit_export      => CONNECTED_TO_altpll_1_locked_conduit_export,      --      altpll_1_locked_conduit.export
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			clk_0_clk                           => CONNECTED_TO_clk_0_clk,                           --                        clk_0.clk
			dram_clk_clk                        => CONNECTED_TO_dram_clk_clk,                        --                     dram_clk.clk
			gsensor_MISO                        => CONNECTED_TO_gsensor_MISO,                        --                      gsensor.MISO
			gsensor_MOSI                        => CONNECTED_TO_gsensor_MOSI,                        --                             .MOSI
			gsensor_SCLK                        => CONNECTED_TO_gsensor_SCLK,                        --                             .SCLK
			gsensor_SS_n                        => CONNECTED_TO_gsensor_SS_n,                        --                             .SS_n
			ledr_export                         => CONNECTED_TO_ledr_export,                         --                         ledr.export
			modular_adc_0_adc_pll_locked_export => CONNECTED_TO_modular_adc_0_adc_pll_locked_export, -- modular_adc_0_adc_pll_locked.export
			reset_reset_n                       => CONNECTED_TO_reset_reset_n,                       --                        reset.reset_n
			reset_0_reset_n                     => CONNECTED_TO_reset_0_reset_n,                     --                      reset_0.reset_n
			sdram_addr                          => CONNECTED_TO_sdram_addr,                          --                        sdram.addr
			sdram_ba                            => CONNECTED_TO_sdram_ba,                            --                             .ba
			sdram_cas_n                         => CONNECTED_TO_sdram_cas_n,                         --                             .cas_n
			sdram_cke                           => CONNECTED_TO_sdram_cke,                           --                             .cke
			sdram_cs_n                          => CONNECTED_TO_sdram_cs_n,                          --                             .cs_n
			sdram_dq                            => CONNECTED_TO_sdram_dq,                            --                             .dq
			sdram_dqm                           => CONNECTED_TO_sdram_dqm,                           --                             .dqm
			sdram_ras_n                         => CONNECTED_TO_sdram_ras_n,                         --                             .ras_n
			sdram_we_n                          => CONNECTED_TO_sdram_we_n,                          --                             .we_n
			sw_export                           => CONNECTED_TO_sw_export                            --                           sw.export
		);

