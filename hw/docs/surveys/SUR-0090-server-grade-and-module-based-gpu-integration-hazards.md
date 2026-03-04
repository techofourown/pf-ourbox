# Server-grade and module-based GPU integration hazards in consumer systems

This shared note is a buyer-facing hazard checklist for server-grade accelerators, passive datacenter cards, and module/carrier ecosystems.

- **Passive as sold means not self-cooling in a tower case.** A bare passive card requires a validated airflow assembly (blower, shroud, duct, or equivalent), not hope.
- **Power connectors can be electrically related but still unsafe in practice.** Mechanical keying, latch geometry, and pinout family checks are mandatory before procurement.
- **Aftermarket shrouds change effective dimensions.** A card that “fits on paper” can fail once the cooling accessory stack is installed.
- **Fan kits are not universally interchangeable.** Mount pattern, pressure profile, sealing behavior, and connector style can invalidate generic “compatible” claims.
- **Fan current draw and fan lead length are deployment facts.** Header limits, adapter needs, and cable extension needs must be validated with the exact fan model.
- **Module/carrier ecosystems are platforms, not cards.** MXM modules, carriers, and M.2 accelerators require an end-to-end stack definition before they are procurement-ready.
- **Exact validated accessory stacks beat generic compatibility claims.** Procurement should require the exact board, exact harness, exact cooling parts, exact fan-power method, and exact firmware/runtime assumptions.

P100-methodology reminder: electrically plausible still can fail mechanically; shroud-fit can fail case-fit; compact shrouds can fail fan-interface expectations; related connector families can fail latch/body geometry; blower fans can fail header and cable-length constraints; aftermarket kits may require sealing, adaptation, or additional wiring to function correctly.
