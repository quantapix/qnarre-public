







import Proving.USC.T42.Ontology.Statute

namespace Proving.USC.T42.Ontology

open Proving.USC.Common


theorem protectedContractorMembership_intro
    {x p r c}
    (hContractor : IsProtectedContractor x c)
    (hPerson : IsPersonInUS p c)
    (hRel : IsContractRelationship r c)
    : ProtectedContractorMembership x p r c :=
  ⟨hContractor, hPerson, hRel⟩


theorem recipientMembership_intro
    {e f a c}
    (hRecipient : IsRecipient e c)
    (hProgram : IsFundedProgram f c)
    (hAssist : IsFederalFinancialAssistance a c)
    : RecipientMembership e f a c :=
  ⟨hRecipient, hProgram, hAssist⟩


theorem neglectfulPreventorMembership_intro
    {n g c}
    (hPreventor : IsNeglectfulPreventor n c)
    (hConspiracy : IsCivilRightsConspiracy g c)
    : NeglectfulPreventorMembership n g c :=
  ⟨hPreventor, hConspiracy⟩


theorem abrogatedStateMembership_intro
    {s e c}
    (hState : IsState s c)
    (hRecipient : IsRecipient e c)
    : AbrogatedStateMembership s e c :=
  ⟨hState, hRecipient⟩


theorem complainingPartyCase_intro
    {x c}
    (hParty : IsComplainingParty x c)
    : ComplainingPartyCase x c :=
  .byEnumeration hParty

end Proving.USC.T42.Ontology
