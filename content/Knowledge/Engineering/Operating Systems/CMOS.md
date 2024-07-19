---
title: CMOS
---

The [[BIOS]] needs to retain certain config data after the computer is powered off. For example:
- System time.
- Boot device sequence (i.e. the order of devices to boot into).
- Hardware settings.

This data is stored on the CMOS (complementary metal-oxide semiconductor) chip on motherboards (the chip may not be present actually, it might be integrated with some other thing). The CMOS chip *is* in fact a *volatile* storage device. It has an on-board lithium battery that keeps the storage active.
![[Knowledge/Engineering/Operating Systems/assets/cmos-on-motherboard.png|500]]
- Ejecting the battery causes the CMOS to be cleared, and all the config data resets to defaults specified by the BIOS.
