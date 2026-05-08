---
layout: post
title: "Part III: SIPPs and the missing registry"
date: 2026-05-08
---

Parts I and II identify two structural problems: no documented tax arrangement at the point of contribution, and no regulatory mechanism to enforce one. This post sketches what such a mechanism might look like, and why the obvious model already exists elsewhere.

## The disclosure gap

When you buy a bond, an equity, or a structured product, the thing you are buying has an identifier. An ISIN. A CFI code. A prospectus registered somewhere. The terms are fixed at issuance and do not change without triggering a formal process. If the issuer wants to change the terms, they issue a new instrument.

When you make a SIPP contribution, the tax arrangement you are entering has none of this. No identifier. No versioned terms document. No registry. What you are entering is defined entirely by whatever statute currently says — and that can change.

The gap is not about taxation per se. HMRC is entitled to offer any tax arrangements it chooses, change what it offers going forward, and withdraw arrangements that no longer serve policy. The gap is about the absence of a mechanism that records which arrangement a taxpayer entered, under what terms, and at what point. Without that, "we are just changing tax law" and "we are rewriting the terms of an existing deal" are indistinguishable — which is exactly the ambiguity that enables the 2027 IHT change.

## A short history of identifiers

The financial industry kept running into the same problem: opacity about what instrument existed, who held it, and under what terms. Each crisis revealed the cost of that opacity. Each time, the solution was an identifier standard.

**CUSIP (1968)** — Committee on Uniform Security Identification Procedures. Created after the US paperwork crisis of the 1960s when brokers could not process trades fast enough because there was no standard way to identify securities across firms. Manual reconciliation was failing at scale.

**ISIN (1981, ISO 6166)** — International Securities Identification Number. Extended the CUSIP model globally. A 12-character alphanumeric code identifying any security in any market. Managed by national numbering agencies under ANNA (Association of National Numbering Agencies), the international body that coordinates the system.

**CFI codes (ISO 10962)** — Classification of Financial Instruments. A 6-character code that classifies the *type* of instrument — equity, debt, entitlement, derivative — and its key structural attributes. Works alongside ISINs: the ISIN says *which* instrument, the CFI says *what kind* and *what its terms look like*.

**LEI (2012)** — Legal Entity Identifier. Created after the 2008 financial crisis because regulators could not map counterparty exposure in OTC derivatives — nobody knew who owed what to whom because there was no standard identifier for legal entities. The FSB mandated LEIs globally. Now required for any entity that trades financial instruments.

**UTI/USI** — Unique Trade Identifiers / Unique Swap Identifiers. Post-Dodd-Frank (2010) and EMIR (2012), every derivatives trade receives a unique identifier so regulators can track individual contracts, their terms, and their lifecycle. A UTI is the ISIN for a specific transaction rather than an instrument class.

The pattern is consistent: absence of identifiers → opacity about who holds what under what terms → crisis reveals the cost → identifier standard mandated.

## What a tax arrangement registry would look like

HMRC offers tax arrangements — SIPP, ISA, EIS, SEIS, VCT, and others. Each is a product with terms: what goes in, how it is taxed, what happens on exit or death. Those terms change over time.

A registry would assign each distinct version of each arrangement a unique identifier — call it a Tax Arrangement Identifier (TAI). When a taxpayer enters the arrangement, the contribution is recorded against the TAI in force at that point. If HMRC changes the terms, it issues a new TAI. Existing contributions remain under their original TAI unless the taxpayer affirmatively elects to switch.

This is not novel infrastructure. It is what ANNA, the LEI system, and trade repositories already do for financial instruments. The data model is understood. The governance model is understood. The only missing piece is the political will to treat tax arrangements as the bilateral deals they functionally are.

Under this model, the 2027 IHT change would either have required HMRC to grandfather existing TAIs — leaving pre-change contributions under the old terms — or to have disclosed at the point of contribution that the IHT treatment was a revocable feature of the current TAI, not a fixed term. Either outcome maps cleanly onto the two scenarios in Part I. What it eliminates is the current ambiguity that allows neither accountability nor redress.
