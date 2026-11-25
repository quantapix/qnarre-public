import Proving.USC.T21.Ontology.Types
import Proving.USC.T21.Ontology.Predicates
import Proving.USC.Common.Types













namespace Proving.USC.T21.Ontology

open Proving.USC.Common (Person Entity ComplaintText)




structure DefEdge where
  defined : String
  dependsOn : String
  citeDefine : String






structure ControlledSubstanceMembership (s : Substance) (c : ComplaintText) : Prop where
  base : IsDrug s c ∨ IsImmediatePrecursor s c
  member : IsControlledSubstance s c



structure CounterfeitSubstanceMembership (s : Substance) (c : ComplaintText) : Prop where
  controlled : IsControlledSubstance s c
  member : IsCounterfeitSubstance s c


inductive ListedChemicalMembership (s : Substance) (c : ComplaintText) : Prop where
  | viaListI (listI : IsListIChemical s c) (member : IsListedChemical s c)
  | viaListII (listII : IsListIIChemical s c) (member : IsListedChemical s c)



structure DispensingMembership (a : DrugAct) (deliverer recipient : Person)
    (c : ComplaintText) : Prop where
  delivery : IsDelivery a c
  byPractitioner : IsPractitioner deliverer c
  toUltimateUser : IsUltimateUser recipient c
  member : IsDispensing a c



structure DistributionMembership (a : DrugAct) (c : ComplaintText) : Prop where
  delivery : IsDelivery a c
  notAdministering : ¬ IsAdministering a c
  notDispensing : ¬ IsDispensing a c
  member : IsDistribution a c



structure ProductionViaManufacture (a : DrugAct) (c : ComplaintText) : Prop where
  manufacture : IsManufacturing a c
  member : IsProduction a c




inductive NarcoticDrugMembership (s : Substance) (c : ComplaintText) : Prop where
  | viaOpiate (opiate : IsOpiate s c) (member : IsNarcoticDrug s c)
  | viaPoppyStraw (straw : IsPoppyStraw s c) (member : IsNarcoticDrug s c)
  | viaChemicalIdentity (member : IsNarcoticDrug s c)



structure MaintenanceTreatmentMembership (a : DrugAct) (s : Substance)
    (c : ComplaintText) : Prop where
  dispensing : IsDispensing a c
  narcotic : IsNarcoticDrug s c
  member : IsMaintenanceTreatment a c



structure DetoxificationTreatmentMembership (a : DrugAct) (s : Substance)
    (c : ComplaintText) : Prop where
  dispensing : IsDispensing a c
  narcotic : IsNarcoticDrug s c
  member : IsDetoxificationTreatment a c



structure RegulatedPersonViaListedChemical (p : Person) (s : Substance)
    (c : ComplaintText) : Prop where
  chemical : IsListedChemical s c
  member : IsRegulatedPerson p c



inductive FelonyDrugOffenseMembership (o : Offense) (s : Substance)
    (c : ComplaintText) : Prop where
  | viaNarcotic (narcotic : IsNarcoticDrug s c) (member : IsFelonyDrugOffense o c)
  | viaMarihuana (marihuana : IsMarihuana s c) (member : IsFelonyDrugOffense o c)
  | viaAnabolicSteroid (steroid : IsAnabolicSteroid s c) (member : IsFelonyDrugOffense o c)
  | viaDepressantStimulant (ds : IsDepressantOrStimulantSubstance s c) (member : IsFelonyDrugOffense o c)




structure DateRapeDrugViaAnalogue (s : Substance) (c : ComplaintText) : Prop where
  analogue : IsControlledSubstanceAnalogue s c
  member : IsDateRapeDrug s c



inductive AuthorizedPurchaserMembership (p : Person) (c : ComplaintText) : Prop where
  | viaPrescription {prescriber : Person}
      (relationship : HasQualifyingMedicalRelationship p prescriber c)
      (prescriberPractitioner : IsPractitioner prescriber c)
      (member : IsAuthorizedPurchaser p c)
  | viaRegistrant (practitioner : IsPractitioner p c) (member : IsAuthorizedPurchaser p c)
  | viaDocumentation (member : IsAuthorizedPurchaser p c)



structure DeliveryByInternetMembership (a : DrugAct) (c : ComplaintText) : Prop where
  delivery : IsDelivery a c
  member : IsDeliveryByInternet a c



structure OnlinePharmacyMembership (e : Entity) (a : DrugAct) (s : Substance)
    (c : ComplaintText) : Prop where
  controlled : IsControlledSubstance s c
  internetDelivery : IsDeliveryByInternet a c
  member : IsOnlinePharmacy e c






def defEdges : List DefEdge := [
  { defined := "addict", dependsOn := "narcotic drug", citeDefine := "21 USC § 802(1)" },
  { defined := "administer", dependsOn := "controlled substance", citeDefine := "21 USC § 802(2)" },
  { defined := "administer", dependsOn := "practitioner", citeDefine := "21 USC § 802(2)" },
  { defined := "agent", dependsOn := "manufacturer", citeDefine := "21 USC § 802(3)" },
  { defined := "agent", dependsOn := "distributor", citeDefine := "21 USC § 802(3)" },
  { defined := "agent", dependsOn := "dispenser", citeDefine := "21 USC § 802(3)" },
  { defined := "control", dependsOn := "drug", citeDefine := "21 USC § 802(5)" },
  { defined := "control", dependsOn := "immediate precursor", citeDefine := "21 USC § 802(5)" },
  { defined := "control", dependsOn := "schedule (21 USC § 812)", citeDefine := "21 USC § 802(5)" },
  { defined := "controlled substance", dependsOn := "drug", citeDefine := "21 USC § 802(6)" },
  { defined := "controlled substance", dependsOn := "immediate precursor", citeDefine := "21 USC § 802(6)" },
  { defined := "controlled substance", dependsOn := "schedule (21 USC § 812)", citeDefine := "21 USC § 802(6)" },
  { defined := "counterfeit substance", dependsOn := "controlled substance", citeDefine := "21 USC § 802(7)" },
  { defined := "counterfeit substance", dependsOn := "manufacturer", citeDefine := "21 USC § 802(7)" },
  { defined := "counterfeit substance", dependsOn := "distributor", citeDefine := "21 USC § 802(7)" },
  { defined := "counterfeit substance", dependsOn := "dispenser", citeDefine := "21 USC § 802(7)" },
  { defined := "deliver", dependsOn := "controlled substance", citeDefine := "21 USC § 802(8)" },
  { defined := "deliver", dependsOn := "listed chemical", citeDefine := "21 USC § 802(8)" },
  { defined := "depressant or stimulant substance", dependsOn := "drug", citeDefine := "21 USC § 802(9)" },
  { defined := "dispense", dependsOn := "deliver", citeDefine := "21 USC § 802(10)" },
  { defined := "dispense", dependsOn := "controlled substance", citeDefine := "21 USC § 802(10)" },
  { defined := "dispense", dependsOn := "ultimate user", citeDefine := "21 USC § 802(10)" },
  { defined := "dispense", dependsOn := "practitioner", citeDefine := "21 USC § 802(10)" },
  { defined := "dispenser", dependsOn := "dispense", citeDefine := "21 USC § 802(10)" },
  { defined := "dispenser", dependsOn := "practitioner", citeDefine := "21 USC § 802(10)" },
  { defined := "distribute", dependsOn := "deliver", citeDefine := "21 USC § 802(11)" },
  { defined := "distribute", dependsOn := "administer", citeDefine := "21 USC § 802(11)" },
  { defined := "distribute", dependsOn := "dispense", citeDefine := "21 USC § 802(11)" },
  { defined := "distribute", dependsOn := "controlled substance", citeDefine := "21 USC § 802(11)" },
  { defined := "distribute", dependsOn := "listed chemical", citeDefine := "21 USC § 802(11)" },
  { defined := "distributor", dependsOn := "distribute", citeDefine := "21 USC § 802(11)" },
  { defined := "drug", dependsOn := "drug (21 USC § 321(g)(1))", citeDefine := "21 USC § 802(12)" },
  { defined := "isomer", dependsOn := "schedule (21 USC § 812)", citeDefine := "21 USC § 802(14)" },
  { defined := "manufacture", dependsOn := "production", citeDefine := "21 USC § 802(15)" },
  { defined := "manufacture", dependsOn := "drug", citeDefine := "21 USC § 802(15)" },
  { defined := "manufacture", dependsOn := "practitioner", citeDefine := "21 USC § 802(15)" },
  { defined := "manufacturer", dependsOn := "manufacture", citeDefine := "21 USC § 802(15)" },
  { defined := "marihuana", dependsOn := "hemp (7 USC § 1639o)", citeDefine := "21 USC § 802(16)" },
  { defined := "narcotic drug", dependsOn := "opiate", citeDefine := "21 USC § 802(17)" },
  { defined := "narcotic drug", dependsOn := "poppy straw", citeDefine := "21 USC § 802(17)" },
  { defined := "opiate", dependsOn := "drug", citeDefine := "21 USC § 802(18)" },
  { defined := "poppy straw", dependsOn := "opium poppy", citeDefine := "21 USC § 802(20)" },
  { defined := "practitioner", dependsOn := "controlled substance", citeDefine := "21 USC § 802(21)" },
  { defined := "production", dependsOn := "manufacture", citeDefine := "21 USC § 802(22)" },
  { defined := "production", dependsOn := "controlled substance", citeDefine := "21 USC § 802(22)" },
  { defined := "immediate precursor", dependsOn := "controlled substance", citeDefine := "21 USC § 802(23)" },
  { defined := "immediate precursor", dependsOn := "manufacture", citeDefine := "21 USC § 802(23)" },
  { defined := "ultimate user", dependsOn := "controlled substance", citeDefine := "21 USC § 802(27)" },
  { defined := "maintenance treatment", dependsOn := "dispense", citeDefine := "21 USC § 802(29)" },
  { defined := "maintenance treatment", dependsOn := "narcotic drug", citeDefine := "21 USC § 802(29)" },
  { defined := "detoxification treatment", dependsOn := "dispense", citeDefine := "21 USC § 802(30)" },
  { defined := "detoxification treatment", dependsOn := "narcotic drug", citeDefine := "21 USC § 802(30)" },
  { defined := "controlled substance analogue", dependsOn := "controlled substance", citeDefine := "21 USC § 802(32)" },
  { defined := "controlled substance analogue", dependsOn := "schedule (21 USC § 812)", citeDefine := "21 USC § 802(32)" },
  { defined := "controlled substance analogue", dependsOn := "listed chemical", citeDefine := "21 USC § 802(32)(B)" },
  { defined := "listed chemical", dependsOn := "list I chemical", citeDefine := "21 USC § 802(33)" },
  { defined := "listed chemical", dependsOn := "list II chemical", citeDefine := "21 USC § 802(33)" },
  { defined := "list I chemical", dependsOn := "controlled substance", citeDefine := "21 USC § 802(34)" },
  { defined := "list II chemical", dependsOn := "list I chemical", citeDefine := "21 USC § 802(35)" },
  { defined := "list II chemical", dependsOn := "controlled substance", citeDefine := "21 USC § 802(35)" },
  { defined := "regular customer", dependsOn := "regulated person", citeDefine := "21 USC § 802(36)" },
  { defined := "regular importer", dependsOn := "listed chemical", citeDefine := "21 USC § 802(37)" },
  { defined := "regulated person", dependsOn := "listed chemical", citeDefine := "21 USC § 802(38)" },
  { defined := "regulated person", dependsOn := "tableting machine", citeDefine := "21 USC § 802(38)" },
  { defined := "regulated person", dependsOn := "encapsulating machine", citeDefine := "21 USC § 802(38)" },
  { defined := "regulated person", dependsOn := "broker or trader", citeDefine := "21 USC § 802(38)" },
  { defined := "regulated person", dependsOn := "international transaction", citeDefine := "21 USC § 802(38)" },
  { defined := "regulated transaction", dependsOn := "listed chemical", citeDefine := "21 USC § 802(39)(A)" },
  { defined := "regulated transaction", dependsOn := "regulated person", citeDefine := "21 USC § 802(39)(A)(i)" },
  { defined := "regulated transaction", dependsOn := "scheduled listed chemical product", citeDefine := "21 USC § 802(39)(A)(v)" },
  { defined := "regulated transaction", dependsOn := "regulated seller", citeDefine := "21 USC § 802(39)(A)(v)" },
  { defined := "regulated transaction", dependsOn := "chemical mixture", citeDefine := "21 USC § 802(39)(A)(vi)" },
  { defined := "regulated transaction", dependsOn := "tableting machine", citeDefine := "21 USC § 802(39)(B)" },
  { defined := "regulated transaction", dependsOn := "encapsulating machine", citeDefine := "21 USC § 802(39)(B)" },
  { defined := "chemical mixture", dependsOn := "list I chemical", citeDefine := "21 USC § 802(40)" },
  { defined := "chemical mixture", dependsOn := "list II chemical", citeDefine := "21 USC § 802(40)" },
  { defined := "anabolic steroid", dependsOn := "drug", citeDefine := "21 USC § 802(41)" },
  { defined := "international transaction", dependsOn := "listed chemical", citeDefine := "21 USC § 802(42)" },
  { defined := "international transaction", dependsOn := "broker or trader", citeDefine := "21 USC § 802(42)" },
  { defined := "broker or trader", dependsOn := "international transaction", citeDefine := "21 USC § 802(43)" },
  { defined := "broker or trader", dependsOn := "listed chemical", citeDefine := "21 USC § 802(43)" },
  { defined := "felony drug offense", dependsOn := "narcotic drug", citeDefine := "21 USC § 802(44)" },
  { defined := "felony drug offense", dependsOn := "marihuana", citeDefine := "21 USC § 802(44)" },
  { defined := "felony drug offense", dependsOn := "anabolic steroid", citeDefine := "21 USC § 802(44)" },
  { defined := "felony drug offense", dependsOn := "depressant or stimulant substance", citeDefine := "21 USC § 802(44)" },
  { defined := "scheduled listed chemical product", dependsOn := "controlled substance", citeDefine := "21 USC § 802(45)(B)" },
  { defined := "scheduled listed chemical product", dependsOn := "schedule (21 USC § 812)", citeDefine := "21 USC § 802(45)(B)" },
  { defined := "regulated seller", dependsOn := "retail distributor", citeDefine := "21 USC § 802(46)" },
  { defined := "mobile retail vendor", dependsOn := "at retail", citeDefine := "21 USC § 802(47)" },
  { defined := "at retail", dependsOn := "scheduled listed chemical product", citeDefine := "21 USC § 802(48)" },
  { defined := "retail distributor", dependsOn := "distributor", citeDefine := "21 USC § 802(49)" },
  { defined := "deliver, distribute, or dispense by means of the Internet", dependsOn := "deliver", citeDefine := "21 USC § 802(51)" },
  { defined := "deliver, distribute, or dispense by means of the Internet", dependsOn := "distribute", citeDefine := "21 USC § 802(51)" },
  { defined := "deliver, distribute, or dispense by means of the Internet", dependsOn := "dispense", citeDefine := "21 USC § 802(51)" },
  { defined := "deliver, distribute, or dispense by means of the Internet", dependsOn := "controlled substance", citeDefine := "21 USC § 802(51)" },
  { defined := "deliver, distribute, or dispense by means of the Internet", dependsOn := "Internet", citeDefine := "21 USC § 802(51)" },
  { defined := "online pharmacy", dependsOn := "controlled substance", citeDefine := "21 USC § 802(52)" },
  { defined := "online pharmacy", dependsOn := "Internet", citeDefine := "21 USC § 802(52)" },
  { defined := "online pharmacy", dependsOn := "deliver, distribute, or dispense by means of the Internet", citeDefine := "21 USC § 802(52)" },
  { defined := "online pharmacy", dependsOn := "practitioner", citeDefine := "21 USC § 802(52)(B)(ii)" },
  { defined := "online pharmacy", dependsOn := "refilling prescriptions for controlled substances in schedule III, IV, or V", citeDefine := "21 USC § 802(52)(B)(viii)" },
  { defined := "online pharmacy", dependsOn := "filling new prescriptions for controlled substances in schedule III, IV, or V", citeDefine := "21 USC § 802(52)(B)(viii)" },
  { defined := "homepage", dependsOn := "online pharmacy", citeDefine := "21 USC § 802(53)" },
  { defined := "homepage", dependsOn := "Internet", citeDefine := "21 USC § 802(53)" },
  { defined := "practice of telemedicine", dependsOn := "practitioner", citeDefine := "21 USC § 802(54)" },
  { defined := "practice of telemedicine", dependsOn := "controlled substance", citeDefine := "21 USC § 802(54)(D)(ii)" },
  { defined := "refilling prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "controlled substance", citeDefine := "21 USC § 802(55)" },
  { defined := "refilling prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "practitioner", citeDefine := "21 USC § 802(55)" },
  { defined := "refilling prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "prescription (21 USC § 829)", citeDefine := "21 USC § 802(55)" },
  { defined := "filling new prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "controlled substance", citeDefine := "21 USC § 802(56)" },
  { defined := "filling new prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "practitioner", citeDefine := "21 USC § 802(56)" },
  { defined := "filling new prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "prescription (21 USC § 829)", citeDefine := "21 USC § 802(56)" },
  { defined := "filling new prescriptions for controlled substances in schedule III, IV, or V", dependsOn := "Internet", citeDefine := "21 USC § 802(56)(A)" },
  { defined := "suspicious order", dependsOn := "controlled substance", citeDefine := "21 USC § 802(57)" },
  { defined := "serious drug felony", dependsOn := "offense (18 USC § 924(e)(2))", citeDefine := "21 USC § 802(58)" },
  { defined := "serious violent felony", dependsOn := "offense (18 USC § 3559(c)(2))", citeDefine := "21 USC § 802(59)(A)" },
  { defined := "serious violent felony", dependsOn := "offense (18 USC § 113)", citeDefine := "21 USC § 802(59)(B)" },
  { defined := "fentanyl-related substance", dependsOn := "schedule I (21 USC § 812(c))", citeDefine := "21 USC § 802(60)" },
  { defined := "date rape drug", dependsOn := "controlled substance analogue", citeDefine := "21 USC § 841(g)(2)(A)" },
  { defined := "authorized purchaser", dependsOn := "practitioner", citeDefine := "21 USC § 841(g)(2)(B)(i)" },
  { defined := "authorized purchaser", dependsOn := "qualifying medical relationship", citeDefine := "21 USC § 841(g)(2)(B)(i)" },
  { defined := "authorized purchaser", dependsOn := "date rape drug", citeDefine := "21 USC § 841(g)(2)(B)(iii)" },
  { defined := "qualifying medical relationship", dependsOn := "practitioner", citeDefine := "21 USC § 841(g)(2)(B)(i)" },
  { defined := "§ 841(a) prohibited acts (using section)", dependsOn := "controlled substance", citeDefine := "21 USC § 841(a)(1)" },
  { defined := "§ 841(a) prohibited acts (using section)", dependsOn := "counterfeit substance", citeDefine := "21 USC § 841(a)(2)" },
  { defined := "§ 841(a) prohibited acts (using section)", dependsOn := "manufacture", citeDefine := "21 USC § 841(a)(1)" },
  { defined := "§ 841(a) prohibited acts (using section)", dependsOn := "distribute", citeDefine := "21 USC § 841(a)(1)" },
  { defined := "§ 841(a) prohibited acts (using section)", dependsOn := "dispense", citeDefine := "21 USC § 841(a)(1)" },
  { defined := "§ 841(b) penalties (using section)", dependsOn := "felony drug offense", citeDefine := "21 USC § 841(b)(1)(C)" },
  { defined := "§ 841(b) penalties (using section)", dependsOn := "serious bodily injury", citeDefine := "21 USC § 841(b)(1)(C)" },
  { defined := "§ 841(b) penalties (using section)", dependsOn := "marihuana", citeDefine := "21 USC § 841(b)(1)(A)(vii)" },
  { defined := "§ 841(b) penalties (using section)", dependsOn := "fentanyl-related substance", citeDefine := "21 USC § 841(b)(1)(A)(vi)" },
  { defined := "§ 841(b)(7) drug-facilitated crime of violence (using section)", dependsOn := "controlled substance analogue", citeDefine := "21 USC § 841(b)(7)(A)" },
  { defined := "§ 841(b)(7) drug-facilitated crime of violence (using section)", dependsOn := "without that individual's knowledge", citeDefine := "21 USC § 841(b)(7)(A)" },
  { defined := "§ 841(c) listed-chemical offenses (using section)", dependsOn := "listed chemical", citeDefine := "21 USC § 841(c)" },
  { defined := "§ 841(d) boobytrap offenses (using section)", dependsOn := "boobytrap", citeDefine := "21 USC § 841(d)(1)" },
  { defined := "§ 841(e) chemical injunction (using section)", dependsOn := "listed chemical", citeDefine := "21 USC § 841(e)" },
  { defined := "§ 841(f) chemical distribution offenses (using section)", dependsOn := "listed chemical", citeDefine := "21 USC § 841(f)(1)" },
  { defined := "§ 841(g) Internet date-rape-drug offense (using section)", dependsOn := "date rape drug", citeDefine := "21 USC § 841(g)(1)" },
  { defined := "§ 841(g) Internet date-rape-drug offense (using section)", dependsOn := "authorized purchaser", citeDefine := "21 USC § 841(g)(1)(B)" },
  { defined := "§ 841(g) Internet date-rape-drug offense (using section)", dependsOn := "Internet", citeDefine := "21 USC § 841(g)(1)" },
  { defined := "§ 841(h) Internet delivery offense (using section)", dependsOn := "deliver, distribute, or dispense by means of the Internet", citeDefine := "21 USC § 841(h)(1)(A)" },
  { defined := "§ 841(h) Internet delivery offense (using section)", dependsOn := "online pharmacy", citeDefine := "21 USC § 841(h)(2)(A)" },
  { defined := "§ 846 attempt and conspiracy (using section)", dependsOn := "attempt", citeDefine := "21 USC § 846" },
  { defined := "§ 846 attempt and conspiracy (using section)", dependsOn := "conspiracy", citeDefine := "21 USC § 846" }]

end Proving.USC.T21.Ontology
