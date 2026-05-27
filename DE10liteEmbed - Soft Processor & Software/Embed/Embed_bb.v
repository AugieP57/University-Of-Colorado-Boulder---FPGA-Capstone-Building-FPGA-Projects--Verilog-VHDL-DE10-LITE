
module Embed (
	altpll_1_areset_conduit_export,
	altpll_1_locked_conduit_export,
	clk_clk,
	clk_0_clk,
	dram_clk_clk,
	gsensor_MISO,
	gsensor_MOSI,
	gsensor_SCLK,
	gsensor_SS_n,
	ledr_export,
	modular_adc_0_adc_pll_locked_export,
	reset_reset_n,
	reset_0_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sw_export);	

	input		altpll_1_areset_conduit_export;
	output		altpll_1_locked_conduit_export;
	input		clk_clk;
	input		clk_0_clk;
	output		dram_clk_clk;
	input		gsensor_MISO;
	output		gsensor_MOSI;
	output		gsensor_SCLK;
	output		gsensor_SS_n;
	output	[9:0]	ledr_export;
	input		modular_adc_0_adc_pll_locked_export;
	input		reset_reset_n;
	input		reset_0_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[9:0]	sw_export;
endmodule
