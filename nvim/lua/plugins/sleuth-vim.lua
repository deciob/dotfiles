-- This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file,
-- or, in the case the current file is new, blank, or otherwise insufficient, by looking at other files of the same type in the current and parent directories.

return {
	"tpope/vim-sleuth",
	-- No further initialisation needed as this is a vim plugin not a lua one.
}
