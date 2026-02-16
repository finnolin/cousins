ItemEvents.tooltip((event) => {
  const heatProtectiveHelmets = [
    "artifacts:plastic_drinking_hat",
    "artifacts:novelty_drinking_hat",
    "artifacts:villager_hat",
    "artifacts:superstitious_hat",
    "artifacts:cowboy_hat",
    "artifacts:anglers_hat",
    "irons_spellbooks:pumpkin_helmet",
    "irons_spellbooks:pyromancer_helmet",
    "irons_spellbooks:electromancer_helmet",
    "irons_spellbooks:archevoker_helmet",
    "irons_spellbooks:netherite_mage_helmet",
    "irons_spellbooks:wizard_hat",
    "irons_spellbooks:wizard_helmet",
    "irons_spellbooks:cultist_helmet",
    "irons_spellbooks:cryomancer_helmet",
    "irons_spellbooks:shadowwalker_helmet",
    "irons_spellbooks:wandering_magician_helmet",
    "create:cardboard_helmet",
    "ad_astra:space_helmet",
    "ad_astra:netherite_space_helmet",
    "ad_astra:jet_suit_helmet",
    "minecraft:leather_helmet",
    "minecraft:turtle_helmet",
  ];

  heatProtectiveHelmets.forEach((item) => {
    event.add(item, Text.gold("Protects from heat stroke"));
  });

  // Conductor caps separately
  event.add(
    /railways:.*_conductor_cap/,
    Text.gold("Protects from heat stroke"),
  );
});
