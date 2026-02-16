ServerEvents.recipes((event) => {
  event.remove({ output: "#forge:ingots/steel", type: "create:mixing" });
  event.remove({
    output: "mekanism:dust_teel",
    type: "mekanism:metallurgic_infuser",
  });
});
