import yaml

HEADER_SHAPE = [
    "id", "name_de", "name_fr", "name_it", "name_en", 
    "description_de", "description_fr", "description_it", "description_en",
    "pred_path", "dimension_type", "scale_type", "data_kind"
]

def main():
    sql_init = f"CREATE TABLE shape_table (\n\tid integer,\n" \
    f"{',\n'.join(f"\t{hdr} text" for hdr in HEADER_SHAPE[1:])}\n);"
    
    with open("description.yaml") as yaml_file:
        data = yaml.safe_load(yaml_file)

    dimensions = data["dimensions"]

    sql_init += "\nINSERT INTO shape_table\nVALUES"

    for index, (dim_name, dim) in enumerate(dimensions.items()):
        value = (
            index, 
            dim["name"]["de"], dim["name"]["fr"], dim["name"]["it"], dim["name"]["en"],
            dim["description"]["de"] if "de" in dim["description"] else "",
            dim["description"]["fr"] if "fr" in dim["description"] else "",
            dim["description"]["it"] if "it" in dim["description"] else "",
            dim["description"]["en"] if "en" in dim["description"] else "",
            dim["path"], dim["dimension-type"], dim["scale-type"], dim["data-kind"] if "data-kind" in dim else ""
        )
        sql_init += f"\n\t{value},"

    with open("shape.sql", "w") as file:
        file.write(sql_init.rstrip(",") + ";")

if __name__ == "__main__":
    main()
    