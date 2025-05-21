CREATE TABLE shape_table (
	id integer,
	name_de text,
	name_fr text,
	name_it text,
	name_en text,
	description_de text,
	description_fr text,
	description_it text,
	description_en text,
	pred_path text,
	dimension_type text,
	scale_type text,
	data_kind text
);
INSERT INTO shape_table
VALUES
	(0, 'Jahr', 'An', 'Anno', 'Year', 'Jahr der Erhebung', '', '', '', 'year', 'Key Dimension', 'ordinal', 'temporal'),
	(1, 'Energieträger', "Source d'energie", 'Fonte di energia', 'Energy source', 'Energieträger der Objekte', "Source d'energie", 'Fonte di energia', 'Energy source', 'energySource', 'Key Dimension', 'nominal', ''),
	(2, 'CO2-Emissionen', 'CO2-Emissions', 'Emissioni di CO2', 'CO2 Emissions', 'Emissionen von CO2 in Millionen Tonnen', 'Emissions de CO2 en millions de tonnes', 'Emissioni di CO2 in milioni di tonnellate', 'Emissions of CO2 in millions of tonnes', 'co2Emissions', 'Measure Dimension', 'ratio', '');