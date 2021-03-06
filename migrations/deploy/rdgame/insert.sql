-- Deploy boardgame:rdgame/insert to pg

BEGIN;

-- new_boardgame(text, posint, posint, posint, text, posint, posint, text)
CREATE FUNCTION new_boardgame(
	bname text, bmina pint,
	bminp pint, bmaxp pint,
	btype text, bnote pint,
	bdur pint, bcre text
) RETURNS boardgame AS $$
INSERT INTO boardgame(
	"name",
	min_age,
	min_players,
	max_players,
	"type",
	note,
	duration,
	creator
) VALUES
(bname, bmina, bminp, bmaxp, btype, bnote, (bdur || ' minutes')::interval, bcre)
RETURNING *;
$$ LANGUAGE sql;

COMMIT;
