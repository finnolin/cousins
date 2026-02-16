ServerEvents.recipes((event) => {
  event.remove({ output: "#forge:ingots/steel", type: "create:mixing" });
  event.remove({ output: "#forge:ingots/steel", type: "ad_astra:alloying" });
  event.remove({ id: "mekanism:processing/steel/enriched_iron_to_dust" });
  event.remove({
    id: "ad_astra:alloying/steel_ingot_from_alloying_iron_ingot_and_coals",
  });
  event.remove({ id: "ad_astra:alloying/steel_ingot" });

  event.remove({ output: "mekanism:jetpack" });
  event.shaped("mekanism:jetpack", ["ABA", "CDC", "EFE"], {
    A: "mekanism:steel_casing",
    B: "mekanism:elite_control_circuit",
    C: "ad_astra:ostrum_engine",
    D: "mekanism:basic_chemical_tank",
    E: "tfmg:exhaust",
    F: "tfmg:plastic_mechanical_pump",
  });
});
