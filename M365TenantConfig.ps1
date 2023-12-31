# Generated with Microsoft365DSC version 1.23.1115.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]

    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.23.1115.1'

    Node localhost
    {
        AADCrossTenantAccessPolicy "AADCrossTenantAccessPolicy"
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }
        AADCrossTenantAccessPolicyConfigurationDefault "AADCrossTenantAccessPolicyConfigurationDefault"
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }
        AADGroupsSettings "AADGroupsSettings"
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }
        AADSecurityDefaults "AADSecurityDefaults"
        {
            Credential           = $Credscredential;
            IsSingleInstance     = "Yes";
        }
        EXOAcceptedDomain "EXOAcceptedDomain-EsdecSolarGroupTest.onmicrosoft.com"
        {
            Credential           = $Credscredential;
            DomainType           = "Authoritative";
            Ensure               = "Present";
            Identity             = "$OrganizationName";
            MatchSubDomains      = $False;
            OutboundOnly         = $False;
        }
        EXOAntiPhishPolicy "EXOAntiPhishPolicy-Office365 AntiPhish Default"
        {
            AdminDisplayName                              = "";
            AuthenticationFailAction                      = "MoveToJmf";
            Credential                                    = $Credscredential;
            Enabled                                       = $True;
            EnableFirstContactSafetyTips                  = $False;
            EnableMailboxIntelligence                     = $True;
            EnableMailboxIntelligenceProtection           = $False;
            EnableOrganizationDomainsProtection           = $False;
            EnableSimilarDomainsSafetyTips                = $False;
            EnableSimilarUsersSafetyTips                  = $False;
            EnableSpoofIntelligence                       = $True;
            EnableTargetedDomainsProtection               = $False;
            EnableTargetedUserProtection                  = $False;
            EnableUnauthenticatedSender                   = $True;
            EnableUnusualCharactersSafetyTips             = $False;
            EnableViaTag                                  = $True;
            Ensure                                        = "Present";
            ExcludedDomains                               = @();
            ExcludedSenders                               = @();
            Identity                                      = "Office365 AntiPhish Default";
            ImpersonationProtectionState                  = "Automatic";
            MailboxIntelligenceProtectionAction           = "NoAction";
            MailboxIntelligenceProtectionActionRecipients = @();
            MailboxIntelligenceQuarantineTag              = "DefaultFullAccessPolicy";
            MakeDefault                                   = $True;
            PhishThresholdLevel                           = 1;
            SpoofQuarantineTag                            = "DefaultFullAccessPolicy";
            TargetedDomainActionRecipients                = @();
            TargetedDomainQuarantineTag                   = "DefaultFullAccessPolicy";
            TargetedDomainsToProtect                      = @();
            TargetedUserActionRecipients                  = @();
            TargetedUserProtectionAction                  = "NoAction";
            TargetedUserQuarantineTag                     = "DefaultFullAccessPolicy";
            TargetedUsersToProtect                        = @();
        }
        EXOAtpPolicyForO365 "EXOAtpPolicyForO365"
        {
            AllowSafeDocsOpen       = $False;
            Credential              = $Credscredential;
            EnableATPForSPOTeamsODB = $False;
            EnableSafeDocs          = $False;
            Identity                = "$OrganizationName\Default";
            IsSingleInstance        = "Yes";
        }
        EXOCASMailboxPlan "EXOCASMailboxPlan-ExchangeOnline-0152e85b-c0e0-4687-b120-ab141729566d"
        {
            ActiveSyncEnabled    = $True;
            Credential           = $Credscredential;
            Identity             = "ExchangeOnline-0152e85b-c0e0-4687-b120-ab141729566d";
            ImapEnabled          = $True;
            OwaMailboxPolicy     = "OwaMailboxPolicy-Default";
            PopEnabled           = $True;
        }
        EXOCASMailboxPlan "EXOCASMailboxPlan-ExchangeOnlineDeskless-be3b6f8d-7b00-467b-9738-098b6fb53038"
        {
            ActiveSyncEnabled    = $True;
            Credential           = $Credscredential;
            Identity             = "ExchangeOnlineDeskless-be3b6f8d-7b00-467b-9738-098b6fb53038";
            ImapEnabled          = $False;
            OwaMailboxPolicy     = "OwaMailboxPolicy-Default";
            PopEnabled           = $True;
        }
        EXOCASMailboxPlan "EXOCASMailboxPlan-ExchangeOnlineEnterprise-bf243a25-ce7e-4eb7-bce1-dae8cc917e6c"
        {
            ActiveSyncEnabled    = $True;
            Credential           = $Credscredential;
            Identity             = "ExchangeOnlineEnterprise-bf243a25-ce7e-4eb7-bce1-dae8cc917e6c";
            ImapEnabled          = $True;
            OwaMailboxPolicy     = "OwaMailboxPolicy-Default";
            PopEnabled           = $True;
        }
        EXOCASMailboxPlan "EXOCASMailboxPlan-ExchangeOnlineEssentials-21d91f8b-baf4-4c62-ad24-9e12121469e6"
        {
            ActiveSyncEnabled    = $True;
            Credential           = $Credscredential;
            Identity             = "ExchangeOnlineEssentials-21d91f8b-baf4-4c62-ad24-9e12121469e6";
            ImapEnabled          = $True;
            OwaMailboxPolicy     = "OwaMailboxPolicy-Default";
            PopEnabled           = $True;
        }
        EXOCASMailboxSettings "EXOCASMailboxSettings-DiscoverySearchMailbox{D919BA05-46A6-415f-80AD-7E09334BB852}"
        {
            ActiveSyncAllowedDeviceIDs              = @();
            ActiveSyncBlockedDeviceIDs              = @();
            ActiveSyncDebugLogging                  = $False;
            ActiveSyncEnabled                       = $True;
            ActiveSyncMailboxPolicy                 = "Default";
            ActiveSyncSuppressReadReceipt           = $False;
            Credential                              = $Credscredential;
            Identity                                = "DiscoverySearchMailbox{D919BA05-46A6-415f-80AD-7E09334BB852}";
            ImapEnabled                             = $True;
            ImapForceICalForCalendarRetrievalOption = $False;
            ImapMessagesRetrievalMimeFormat         = "BestBodyFormat";
            ImapSuppressReadReceipt                 = $False;
            ImapUseProtocolDefaults                 = $True;
            MacOutlookEnabled                       = $True;
            MAPIEnabled                             = $True;
            OutlookMobileEnabled                    = $True;
            OWAEnabled                              = $True;
            OWAforDevicesEnabled                    = $True;
            PopEnabled                              = $True;
            PopForceICalForCalendarRetrievalOption  = $False;
            PopMessagesRetrievalMimeFormat          = "BestBodyFormat";
            PopSuppressReadReceipt                  = $False;
            PopUseProtocolDefaults                  = $True;
            PublicFolderClientAccess                = $False;
            ShowGalAsDefaultView                    = $True;
            UniversalOutlookEnabled                 = $True;
        }
        EXOCASMailboxSettings "EXOCASMailboxSettings-7d647393-1289-4ad2-8db6-7b6e320ee773"
        {
            ActiveSyncAllowedDeviceIDs              = @();
            ActiveSyncBlockedDeviceIDs              = @();
            ActiveSyncDebugLogging                  = $False;
            ActiveSyncEnabled                       = $True;
            ActiveSyncMailboxPolicy                 = "Default";
            ActiveSyncSuppressReadReceipt           = $False;
            Credential                              = $Credscredential;
            EwsEnabled                              = $True;
            Identity                                = "7d647393-1289-4ad2-8db6-7b6e320ee773";
            ImapEnabled                             = $True;
            ImapForceICalForCalendarRetrievalOption = $False;
            ImapMessagesRetrievalMimeFormat         = "BestBodyFormat";
            ImapSuppressReadReceipt                 = $False;
            ImapUseProtocolDefaults                 = $True;
            MacOutlookEnabled                       = $True;
            MAPIEnabled                             = $True;
            OutlookMobileEnabled                    = $True;
            OWAEnabled                              = $True;
            OWAforDevicesEnabled                    = $True;
            OwaMailboxPolicy                        = "OwaMailboxPolicy-Default";
            PopEnabled                              = $True;
            PopForceICalForCalendarRetrievalOption  = $True;
            PopMessagesRetrievalMimeFormat          = "BestBodyFormat";
            PopSuppressReadReceipt                  = $False;
            PopUseProtocolDefaults                  = $True;
            PublicFolderClientAccess                = $False;
            ShowGalAsDefaultView                    = $True;
            UniversalOutlookEnabled                 = $True;
        }
        EXODataClassification "EXODataClassification-dfeb356f-61cd-459e-bf0f-7c6d28b458c6"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Amerikaanse rijbewijsnummers";
            Ensure               = "Present";
            Identity             = "dfeb356f-61cd-459e-bf0f-7c6d28b458c6";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.S. Driver's License Number";
        }
        EXODataClassification "EXODataClassification-7d08b2ff-a0b9-437f-957c-aeddbf9b2b25"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Israëlische bankrekeningnummers.";
            Ensure               = "Present";
            Identity             = "7d08b2ff-a0b9-437f-957c-aeddbf9b2b25";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Israel Bank Account Number";
        }
        EXODataClassification "EXODataClassification-29869db6-602d-4853-ab93-3484f905df50"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Australische paspoortnummers.";
            Ensure               = "Present";
            Identity             = "29869db6-602d-4853-ab93-3484f905df50";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australia Passport Number";
        }
        EXODataClassification "EXODataClassification-a2ce32a8-f935-4bb6-8e96-2a5157672e2c"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Amerikaanse bankrekeningnummers.";
            Ensure               = "Present";
            Identity             = "a2ce32a8-f935-4bb6-8e96-2a5157672e2c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.S. Bank Account Number";
        }
        EXODataClassification "EXODataClassification-e05881f5-1db1-418c-89aa-a3ac5c5277ee"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Israëlische persoonsgebonden nummers.";
            Ensure               = "Present";
            Identity             = "e05881f5-1db1-418c-89aa-a3ac5c5277ee";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Israel National ID";
        }
        EXODataClassification "EXODataClassification-91da9335-1edb-45b7-a95f-5fe41a16c63c"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Duitse rijbewijsnummers of Furerschein.";
            Ensure               = "Present";
            Identity             = "91da9335-1edb-45b7-a95f-5fe41a16c63c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "German Driver's License Number";
        }
        EXODataClassification "EXODataClassification-9a5445ad-406e-43eb-8bd7-cac17ab6d0e4"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Drug Enforcement Agency-nummers (DEA).";
            Ensure               = "Present";
            Identity             = "9a5445ad-406e-43eb-8bd7-cac17ab6d0e4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Drug Enforcement Agency (DEA) Number";
        }
        EXODataClassification "EXODataClassification-104a99a0-3d3b-4542-a40d-ab0b9e1efe63"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nummers van Australische medische dossiers.";
            Ensure               = "Present";
            Identity             = "104a99a0-3d3b-4542-a40d-ab0b9e1efe63";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australia Medical Account Number";
        }
        EXODataClassification "EXODataClassification-14d0db8b-498a-43ed-9fca-f6097ae687eb"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Canadese paspoortnummers.";
            Ensure               = "Present";
            Identity             = "14d0db8b-498a-43ed-9fca-f6097ae687eb";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Passport Number";
        }
        EXODataClassification "EXODataClassification-e29bc95f-ff70-4a37-aa01-04d17360a4c5"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Australische tax file-nummers.";
            Ensure               = "Present";
            Identity             = "e29bc95f-ff70-4a37-aa01-04d17360a4c5";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australia Tax File Number";
        }
        EXODataClassification "EXODataClassification-97d6244f-9157-41bd-8e0c-9d669a5c4d71"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Italiaanse rijbewijsnummers.";
            Ensure               = "Present";
            Identity             = "97d6244f-9157-41bd-8e0c-9d669a5c4d71";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Italy Driver's License Number";
        }
        EXODataClassification "EXODataClassification-18e55a36-a01b-4b0f-943d-dc10282a1824"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Franse rijbewijsnummers";
            Ensure               = "Present";
            Identity             = "18e55a36-a01b-4b0f-943d-dc10282a1824";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Driver's License Number";
        }
        EXODataClassification "EXODataClassification-2e3da144-d42b-47ed-b123-fbf78604e52c"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Duitse paspoortnummers of Reisepass.";
            Ensure               = "Present";
            Identity             = "2e3da144-d42b-47ed-b123-fbf78604e52c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "German Passport Number";
        }
        EXODataClassification "EXODataClassification-71f62b97-efe0-4aa1-aa49-e14de253619d"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert sociale verzekeringsnummers uit Frankrijk ook bekend als INSEE-nummers.";
            Ensure               = "Present";
            Identity             = "71f62b97-efe0-4aa1-aa49-e14de253619d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Social Security Number (INSEE)";
        }
        EXODataClassification "EXODataClassification-e55e2a32-f92d-4985-a35d-a0b269eb687b"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert geformatteerde en niet-geformatteerde individuele belastingidentificatienummers uit de VS.";
            Ensure               = "Present";
            Identity             = "e55e2a32-f92d-4985-a35d-a0b269eb687b";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.S. Individual Taxpayer Identification Number (ITIN)";
        }
        EXODataClassification "EXODataClassification-c840e719-0896-45bb-84fd-1ed5c95e45ff"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Japanse sociale verzekeringsnummers (SIN).";
            Ensure               = "Present";
            Identity             = "c840e719-0896-45bb-84fd-1ed5c95e45ff";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japan Social Insurance Number (SIN)";
        }
        EXODataClassification "EXODataClassification-01c1209b-6389-4faf-a5f8-3f7e13899652"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Japanse residentregistratienummers.";
            Ensure               = "Present";
            Identity             = "01c1209b-6389-4faf-a5f8-3f7e13899652";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japan Resident Registration Number";
        }
        EXODataClassification "EXODataClassification-75177310-1a09-4613-bf6d-833aae3743f8"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Japanse paspoortnummers.";
            Ensure               = "Present";
            Identity             = "75177310-1a09-4613-bf6d-833aae3743f8";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japan Passport Number";
        }
        EXODataClassification "EXODataClassification-cb353f78-2b72-4c3c-8827-92ebe4f69fdf"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert ABA (American Bankers Association) routenummers.";
            Ensure               = "Present";
            Identity             = "cb353f78-2b72-4c3c-8827-92ebe4f69fdf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "ABA Routing Number";
        }
        EXODataClassification "EXODataClassification-3008b884-8c8c-4cd8-a289-99f34fc7ff5d"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Franse paspoortnummers.";
            Ensure               = "Present";
            Identity             = "3008b884-8c8c-4cd8-a289-99f34fc7ff5d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Passport Number";
        }
        EXODataClassification "EXODataClassification-722e12ac-c89a-4ec8-a1b7-fea3469f89db"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Canadese Personal Health Identification-nummers (PHIN).";
            Ensure               = "Present";
            Identity             = "722e12ac-c89a-4ec8-a1b7-fea3469f89db";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Personal Health Identification Number (PHIN)";
        }
        EXODataClassification "EXODataClassification-ac36fef2-a289-4e2c-bb48-b02366e89fc0"
        {
            Credential           = $Credscredential;
            Description          = "Detects Japanese Residence Card Number";
            Ensure               = "Present";
            Identity             = "ac36fef2-a289-4e2c-bb48-b02366e89fc0";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japanese Residence Card Number";
        }
        EXODataClassification "EXODataClassification-98da3da1-9199-4571-b7c4-b6522980b507"
        {
            Credential           = $Credscredential;
            Description          = "Detects Argentina Unique Tax Identification Key (CUIT/CUIL)";
            Ensure               = "Present";
            Identity             = "98da3da1-9199-4571-b7c4-b6522980b507";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Argentina Unique Tax Identification Key (CUIT/CUIL)";
        }
        EXODataClassification "EXODataClassification-a2f29c85-ecb8-4514-a610-364790c0773e"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert geformatteerde en niet-geformatteerde sociale verzekeringsnummers uit Canada.";
            Ensure               = "Present";
            Identity             = "a2f29c85-ecb8-4514-a610-364790c0773e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Social Insurance Number";
        }
        EXODataClassification "EXODataClassification-c6011143-d087-451c-8313-7f6d4aed2270"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Japanse rijbewijsnummers.";
            Ensure               = "Present";
            Identity             = "c6011143-d087-451c-8313-7f6d4aed2270";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japan Driver's License Number";
        }
        EXODataClassification "EXODataClassification-e7dc4711-11b7-4cb0-b88b-2c394a771f0e"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert International Banking Account Numbers.";
            Ensure               = "Present";
            Identity             = "e7dc4711-11b7-4cb0-b88b-2c394a771f0e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "International Banking Account Number (IBAN)";
        }
        EXODataClassification "EXODataClassification-74a54de9-2a30-4aa0-a8aa-3d9327fc07c7"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Australische bankrekeningnummers.";
            Ensure               = "Present";
            Identity             = "74a54de9-2a30-4aa0-a8aa-3d9327fc07c7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australia Bank Account Number";
        }
        EXODataClassification "EXODataClassification-d354f95b-96ee-4b80-80bc-4377312b55bc"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Japanse bankrekeningnummers.";
            Ensure               = "Present";
            Identity             = "d354f95b-96ee-4b80-80bc-4377312b55bc";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japan Bank Account Number";
        }
        EXODataClassification "EXODataClassification-060c591a-0fd7-4598-a715-8a94b283dfcf"
        {
            Credential           = $Credscredential;
            Description          = "Detects Colombia National ID numbers";
            Ensure               = "Present";
            Identity             = "060c591a-0fd7-4598-a715-8a94b283dfcf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Colombia National ID";
        }
        EXODataClassification "EXODataClassification-178ec42a-18b4-47cc-85c7-d62c92fd67f8"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert paspoortnummer uit de VS en het VK.";
            Ensure               = "Present";
            Identity             = "178ec42a-18b4-47cc-85c7-d62c92fd67f8";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.S. / U.K. Passport Number";
        }
        EXODataClassification "EXODataClassification-8c5a0ba8-404a-41a3-8871-746aa21ee6c0"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Saoedi-Arabische persoonsgebonden nummers.";
            Ensure               = "Present";
            Identity             = "8c5a0ba8-404a-41a3-8871-746aa21ee6c0";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Saudi Arabia National ID";
        }
        EXODataClassification "EXODataClassification-552e814c-cb50-4d94-bbaa-bb1d1ffb34de"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Canadese bankrekeningnummers.";
            Ensure               = "Present";
            Identity             = "552e814c-cb50-4d94-bbaa-bb1d1ffb34de";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Bank Account Number";
        }
        EXODataClassification "EXODataClassification-fb621f20-3876-4cfc-acec-8c8e73ca32c7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Turkish National Identification number";
            Ensure               = "Present";
            Identity             = "fb621f20-3876-4cfc-acec-8c8e73ca32c7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Turkish National Identification number";
        }
        EXODataClassification "EXODataClassification-e905ad4d-5a74-406d-bf36-b1efca798af4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Mexico Unique Population Registry Codes (CURP).";
            Ensure               = "Present";
            Identity             = "e905ad4d-5a74-406d-bf36-b1efca798af4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Mexico Unique Population Registry Code (CURP)";
        }
        EXODataClassification "EXODataClassification-cb2ab58c-9cb8-4c81-baf8-a4e106791df4"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert SWIFT (Society for Worldwide Interbank Financial Telecommunication) -codes.";
            Ensure               = "Present";
            Identity             = "cb2ab58c-9cb8-4c81-baf8-a4e106791df4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "SWIFT Code";
        }
        EXODataClassification "EXODataClassification-f93de4be-d94c-40df-a8be-461738047551"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert rijbewijsnummers uit het VK.";
            Ensure               = "Present";
            Identity             = "f93de4be-d94c-40df-a8be-461738047551";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.K. Driver's License Number";
        }
        EXODataClassification "EXODataClassification-59c0bf39-7fab-482c-af25-00faa4384c94"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Canadian Health Service-nummers.";
            Ensure               = "Present";
            Identity             = "59c0bf39-7fab-482c-af25-00faa4384c94";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Health Service Number";
        }
        EXODataClassification "EXODataClassification-3192014e-2a16-44e9-aa69-4b20375c9a78"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nationale gezondheidsnummers uit het VK.";
            Ensure               = "Present";
            Identity             = "3192014e-2a16-44e9-aa69-4b20375c9a78";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.K. National Health Service Number";
        }
        EXODataClassification "EXODataClassification-f753a286-f5cc-47e6-a592-4be25fd02591"
        {
            Credential           = $Credscredential;
            Description          = "Detects Medicare Beneficiary Identifier (MBI) cards.";
            Ensure               = "Present";
            Identity             = "f753a286-f5cc-47e6-a592-4be25fd02591";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Medicare Beneficiary Identifier (MBI) card";
        }
        EXODataClassification "EXODataClassification-f741ac74-1bc0-4665-b69b-f0c7f927c0c4"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Franse identiteitskaartnummers (CNI).";
            Ensure               = "Present";
            Identity             = "f741ac74-1bc0-4665-b69b-f0c7f927c0c4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France National ID Card (CNI)";
        }
        EXODataClassification "EXODataClassification-1cbbc8f5-9216-4392-9eb5-5ac2298d1356"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Australische rijbewijsnummers.";
            Ensure               = "Present";
            Identity             = "1cbbc8f5-9216-4392-9eb5-5ac2298d1356";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-50842eb7-edc8-4019-85dd-5a5c1f2bb085"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert creditcardnummers voor American Express, Diner's Club, Discover Card, JCB, Mastercard en Visa.";
            Ensure               = "Present";
            Identity             = "50842eb7-edc8-4019-85dd-5a5c1f2bb085";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Credit Card Number";
        }
        EXODataClassification "EXODataClassification-f69aaf40-79be-4fac-8f05-fd1910d272c8"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Zweedse persoonsgebonden nummers.";
            Ensure               = "Present";
            Identity             = "f69aaf40-79be-4fac-8f05-fd1910d272c8";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Sweden National ID";
        }
        EXODataClassification "EXODataClassification-44ca9e86-ead7-4c5d-884a-e2eaa401515e"
        {
            Credential           = $Credscredential;
            Description          = "Detects Thai Population Identification Code";
            Ensure               = "Present";
            Identity             = "44ca9e86-ead7-4c5d-884a-e2eaa401515e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Thai Population Identification Code";
        }
        EXODataClassification "EXODataClassification-16c07343-c26f-49d2-a987-3daf717e94cc"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nationale verzekeringsnummers uit het VK.";
            Ensure               = "Present";
            Identity             = "16c07343-c26f-49d2-a987-3daf717e94cc";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.K. National Insurance Number (NINO)";
        }
        EXODataClassification "EXODataClassification-37186abb-8e48-4800-ad3c-e3d1610b3db0"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert rijbewijsnummers uit Canada.";
            Ensure               = "Present";
            Identity             = "37186abb-8e48-4800-ad3c-e3d1610b3db0";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Canada Driver's License Number";
        }
        EXODataClassification "EXODataClassification-e7251cb4-4c2c-41df-963e-924eb3dae04a"
        {
            Credential           = $Credscredential;
            Description          = "Detects Taiwan Passport numbers";
            Ensure               = "Present";
            Identity             = "e7251cb4-4c2c-41df-963e-924eb3dae04a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Taiwan Passport Number";
        }
        EXODataClassification "EXODataClassification-b1fba4f7-7b3e-4bb9-8f9a-9366df604dbb"
        {
            Credential           = $Credscredential;
            Description          = "Detects Australian Company Number";
            Ensure               = "Present";
            Identity             = "b1fba4f7-7b3e-4bb9-8f9a-9366df604dbb";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australian Company Number";
        }
        EXODataClassification "EXODataClassification-d4c8a798-e9f2-4bd3-9652-500d24080fc3"
        {
            Credential           = $Credscredential;
            Description          = "Detects Norway Identity numbers";
            Ensure               = "Present";
            Identity             = "d4c8a798-e9f2-4bd3-9652-500d24080fc3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Norway Identity Number";
        }
        EXODataClassification "EXODataClassification-2b71c1c8-d14e-4430-82dc-fd1ed6bf05c7"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Nieuw-Zeelandse Ministry of Health-nummers.";
            Ensure               = "Present";
            Identity             = "2b71c1c8-d14e-4430-82dc-fd1ed6bf05c7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "New Zealand Ministry of Health Number";
        }
        EXODataClassification "EXODataClassification-3ba8afe5-7a6c-4929-8247-0001b6878438"
        {
            Credential           = $Credscredential;
            Description          = "Detects Cyprus Identity Card";
            Ensure               = "Present";
            Identity             = "3ba8afe5-7a6c-4929-8247-0001b6878438";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Cyprus Identity Card";
        }
        EXODataClassification "EXODataClassification-eefbb00e-8282-433c-8620-8f1da3bffdb2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Argentina National Identity numbers";
            Ensure               = "Present";
            Identity             = "eefbb00e-8282-433c-8620-8f1da3bffdb2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Argentina National Identity (DNI) Number";
        }
        EXODataClassification "EXODataClassification-e63c28a7-ad29-4c17-a41a-3d2a0b70fd9c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hong Kong Identity Card (HKID) numbers";
            Ensure               = "Present";
            Identity             = "e63c28a7-ad29-4c17-a41a-3d2a0b70fd9c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hong Kong Identity Card (HKID) Number";
        }
        EXODataClassification "EXODataClassification-5ec06c3b-007e-4820-8343-7ff73b889735"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Identity Card";
            Ensure               = "Present";
            Identity             = "5ec06c3b-007e-4820-8343-7ff73b889735";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Identity Card";
        }
        EXODataClassification "EXODataClassification-0de78315-9537-47f5-95ab-b3e77eba3993"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungarian Social Security Number (TAJ)";
            Ensure               = "Present";
            Identity             = "0de78315-9537-47f5-95ab-b3e77eba3993";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungarian Social Security Number (TAJ)";
        }
        EXODataClassification "EXODataClassification-bfb26de6-dad5-4d48-ab72-4789cdd0654c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Estonia Personal Identification Code";
            Ensure               = "Present";
            Identity             = "bfb26de6-dad5-4d48-ab72-4789cdd0654c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Estonia Personal Identification Code";
        }
        EXODataClassification "EXODataClassification-60f75aed-81bf-4625-89b0-0846b9248ee7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Finland European Health Insurance Number";
            Ensure               = "Present";
            Identity             = "60f75aed-81bf-4625-89b0-0846b9248ee7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Finland European Health Insurance Number";
        }
        EXODataClassification "EXODataClassification-15a54a5a-53d4-4080-ad43-a2a4fe1d3bf7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Greek Tax identification Number";
            Ensure               = "Present";
            Identity             = "15a54a5a-53d4-4080-ad43-a2a4fe1d3bf7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Greek Tax identification Number";
        }
        EXODataClassification "EXODataClassification-dd0fe2bc-7bcf-455f-bac1-83b1e3eb25fd"
        {
            Credential           = $Credscredential;
            Description          = "Detects New Zealand Inland Revenue number";
            Ensure               = "Present";
            Identity             = "dd0fe2bc-7bcf-455f-bac1-83b1e3eb25fd";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "New Zealand Inland Revenue number";
        }
        EXODataClassification "EXODataClassification-4f320d9b-4972-41ae-b337-88d499bb1ade"
        {
            Credential           = $Credscredential;
            Description          = "Detects Netherlands Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "4f320d9b-4972-41ae-b337-88d499bb1ade";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Netherlands Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-1817a540-221f-4459-9202-3bd78b81d803"
        {
            Credential           = $Credscredential;
            Description          = "Detects Ukraine Passport Number (Domestic)";
            Ensure               = "Present";
            Identity             = "1817a540-221f-4459-9202-3bd78b81d803";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Ukraine Passport Number (Domestic)";
        }
        EXODataClassification "EXODataClassification-a3eea206-dc0c-4f06-9e22-aa1be3059963"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert kiesregisternummers uit het Verenigd Koninkrijk.";
            Ensure               = "Present";
            Identity             = "a3eea206-dc0c-4f06-9e22-aa1be3059963";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.K. Electoral Roll Number";
        }
        EXODataClassification "EXODataClassification-eb5fa399-fe28-4c67-8188-d63a616ed89c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Romania Personal Numerical Code (CNP)";
            Ensure               = "Present";
            Identity             = "eb5fa399-fe28-4c67-8188-d63a616ed89c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Romania Personal Numerical Code (CNP)";
        }
        EXODataClassification "EXODataClassification-60c0725a-4eb6-455b-9dda-05d8a7396497"
        {
            Credential           = $Credscredential;
            Description          = "Detects Czech Personal Identity Numbers";
            Ensure               = "Present";
            Identity             = "60c0725a-4eb6-455b-9dda-05d8a7396497";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Czech Personal Identity Number";
        }
        EXODataClassification "EXODataClassification-ede42eb4-59d9-49eb-9603-d7853fbda91d"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungary Tax identification Number";
            Ensure               = "Present";
            Identity             = "ede42eb4-59d9-49eb-9603-d7853fbda91d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungary Tax identification Number";
        }
        EXODataClassification "EXODataClassification-7f0e921c-9677-435b-aba2-bb8f1013c749"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malaysia Identity Card Number";
            Ensure               = "Present";
            Identity             = "7f0e921c-9677-435b-aba2-bb8f1013c749";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malaysia Identity Card Number";
        }
        EXODataClassification "EXODataClassification-338FD995-4CB5-4F87-AD35-79BD1DD926C1"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nationale id-nummers voor Finland.";
            Ensure               = "Present";
            Identity             = "338FD995-4CB5-4F87-AD35-79BD1DD926C1";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Finland National ID";
        }
        EXODataClassification "EXODataClassification-beaa54d7-ec6a-4160-a37b-f3916b68934b"
        {
            Credential           = $Credscredential;
            Description          = "Detects Singapore Driving License numbers";
            Ensure               = "Present";
            Identity             = "beaa54d7-ec6a-4160-a37b-f3916b68934b";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Singapore Driving License Number";
        }
        EXODataClassification "EXODataClassification-1daa4ad5-e2dd-4ca4-a788-54722c09efb2"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert IP-adressen.";
            Ensure               = "Present";
            Identity             = "1daa4ad5-e2dd-4ca4-a788-54722c09efb2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "IP Address";
        }
        EXODataClassification "EXODataClassification-d89fd329-9324-433c-b687-2c37bd5166f3"
        {
            Credential           = $Credscredential;
            Description          = "Detects Belgium Driver's License Number";
            Ensure               = "Present";
            Identity             = "d89fd329-9324-433c-b687-2c37bd5166f3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Belgium Driver's License Number";
        }
        EXODataClassification "EXODataClassification-0e9b3178-9678-47dd-a509-37222ca96b42"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert debetkaartnummers uit de Europese Unie";
            Ensure               = "Present";
            Identity             = "0e9b3178-9678-47dd-a509-37222ca96b42";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU Debit Card Number";
        }
        EXODataClassification "EXODataClassification-ec996de0-30f2-46b1-b192-4d2ff8805fa7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Latvia Driver's License Number";
            Ensure               = "Present";
            Identity             = "ec996de0-30f2-46b1-b192-4d2ff8805fa7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Latvia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-14240c22-b6de-4ce5-a90b-137f74252513"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovakia Driver's License Number";
            Ensure               = "Present";
            Identity             = "14240c22-b6de-4ce5-a90b-137f74252513";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovakia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-4e979794-49a0-407e-a0b9-2c536937b925"
        {
            Credential           = $Credscredential;
            Description          = "Detects Chile Identity Card numbers";
            Ensure               = "Present";
            Identity             = "4e979794-49a0-407e-a0b9-2c536937b925";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Chile Identity Card Number";
        }
        EXODataClassification "EXODataClassification-b6a3eda2-c56c-4b69-a5f7-dca34db00f48"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Value Added Tax (VAT) Number";
            Ensure               = "Present";
            Identity             = "b6a3eda2-c56c-4b69-a5f7-dca34db00f48";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Value Added Tax (VAT) Number";
        }
        EXODataClassification "EXODataClassification-ff12f884-c20a-4189-b185-34c8e7258d47"
        {
            Credential           = $Credscredential;
            Description          = "Detects Croatia Identity Card numbers";
            Ensure               = "Present";
            Identity             = "ff12f884-c20a-4189-b185-34c8e7258d47";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Croatia Identity Card Number";
        }
        EXODataClassification "EXODataClassification-5df987c0-8eae-4bce-ace7-b316347f3070"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Spaanse socialezekerheidsnummers.";
            Ensure               = "Present";
            Identity             = "5df987c0-8eae-4bce-ace7-b316347f3070";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Spain Social Security Number (SSN)";
        }
        EXODataClassification "EXODataClassification-7b5cc218-7046-47d9-80c9-f325b50896ca"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungary Personal Identification Number";
            Ensure               = "Present";
            Identity             = "7b5cc218-7046-47d9-80c9-f325b50896ca";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungary Personal Identification Number";
        }
        EXODataClassification "EXODataClassification-da68fdb0-f383-4981-8c86-82689d3b7d55"
        {
            Credential           = $Credscredential;
            Description          = "Detects Indonesia Identity Card (KTP) numbers";
            Ensure               = "Present";
            Identity             = "da68fdb0-f383-4981-8c86-82689d3b7d55";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Indonesia Identity Card (KTP) Number";
        }
        EXODataClassification "EXODataClassification-25e8c47e-e6fe-4884-a211-74898f8c0196"
        {
            Credential           = $Credscredential;
            Description          = "Detects Denmark Passport Number";
            Ensure               = "Present";
            Identity             = "25e8c47e-e6fe-4884-a211-74898f8c0196";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Denmark Passport Number";
        }
        EXODataClassification "EXODataClassification-10f0d113-b0e1-47dc-872a-a4f45b9376a3"
        {
            Credential           = $Credscredential;
            Description          = "Detects Spain Tax Identification Number";
            Ensure               = "Present";
            Identity             = "10f0d113-b0e1-47dc-872a-a4f45b9376a3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Spain Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-76ec2f5d-cedb-48e1-8070-1998794af445"
        {
            Credential           = $Credscredential;
            Description          = "Detects a Domestic Russian Passport Number";
            Ensure               = "Present";
            Identity             = "76ec2f5d-cedb-48e1-8070-1998794af445";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Russian Passport Number (Domestic)";
        }
        EXODataClassification "EXODataClassification-ed59e77e-171d-442c-9ec1-88e2ebcb5b0a"
        {
            Credential           = $Credscredential;
            Description          = "Detects France Tax Identification Number (numéro SPI.)";
            Ensure               = "Present";
            Identity             = "ed59e77e-171d-442c-9ec1-88e2ebcb5b0a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Tax Identification Number (numéro SPI.)";
        }
        EXODataClassification "EXODataClassification-976349a0-683b-477a-90f8-ff0a220d5592"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungarian Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "976349a0-683b-477a-90f8-ff0a220d5592";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungarian Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-ac5f4878-75e4-4b82-af2d-02e13ea9f411"
        {
            Credential           = $Credscredential;
            Description          = "Detects an International Russian Passport Number";
            Ensure               = "Present";
            Identity             = "ac5f4878-75e4-4b82-af2d-02e13ea9f411";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Russian Passport Number (International)";
        }
        EXODataClassification "EXODataClassification-2602bfee-9bb0-47a5-a7a6-2bf3053e2804"
        {
            Credential           = $Credscredential;
            Description          = "Detects India Permanent Account numbers";
            Ensure               = "Present";
            Identity             = "2602bfee-9bb0-47a5-a7a6-2bf3053e2804";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "India Permanent Account Number (PAN)";
        }
        EXODataClassification "EXODataClassification-951c26b7-3b35-4f73-924b-15dd599cb9ab"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovakia Personal Number";
            Ensure               = "Present";
            Identity             = "951c26b7-3b35-4f73-924b-15dd599cb9ab";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovakia Personal Number";
        }
        EXODataClassification "EXODataClassification-cfbe032d-22e0-4f28-ab68-d66e9641f1e2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Ukraine Passport Number (International)";
            Ensure               = "Present";
            Identity             = "cfbe032d-22e0-4f28-ab68-d66e9641f1e2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Ukraine Passport Number (International)";
        }
        EXODataClassification "EXODataClassification-4cd79172-8da9-4ff5-9188-98b1e7e2eca6"
        {
            Credential           = $Credscredential;
            Description          = "Detects Italy Fiscal Code";
            Ensure               = "Present";
            Identity             = "4cd79172-8da9-4ff5-9188-98b1e7e2eca6";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Italy Fiscal Code";
        }
        EXODataClassification "EXODataClassification-5b802e18-ba80-44c4-bc83-bf2ad36ae36a"
        {
            Credential           = $Credscredential;
            Description          = "Detects South Korea Resident Registration numbers";
            Ensure               = "Present";
            Identity             = "5b802e18-ba80-44c4-bc83-bf2ad36ae36a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "South Korea Resident Registration Number";
        }
        EXODataClassification "EXODataClassification-03937FB5-D2B6-4487-B61F-0F8BFF7C3517"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Poolse paspoortnummers.";
            Ensure               = "Present";
            Identity             = "03937FB5-D2B6-4487-B61F-0F8BFF7C3517";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Poland Passport";
        }
        EXODataClassification "EXODataClassification-c92daa86-2d16-4871-901f-816b3f554fc1"
        {
            Credential           = $Credscredential;
            Description          = "Detects China Resident Identity Card (PRC) numbers";
            Ensure               = "Present";
            Identity             = "c92daa86-2d16-4871-901f-816b3f554fc1";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "China Resident Identity Card (PRC) Number";
        }
        EXODataClassification "EXODataClassification-fb969c9e-0fd1-4b18-8091-a2123c5e6a54"
        {
            Credential           = $Credscredential;
            Description          = "Detects Belgium National numbers";
            Ensure               = "Present";
            Identity             = "fb969c9e-0fd1-4b18-8091-a2123c5e6a54";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Belgium National Number";
        }
        EXODataClassification "EXODataClassification-005b3ef1-47dd-4e68-bb02-c6db484d00f2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Croatia Driver's License Number";
            Ensure               = "Present";
            Identity             = "005b3ef1-47dd-4e68-bb02-c6db484d00f2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Croatia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-ba4e7456-55a9-4d89-9140-c33673553526"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert Zweedse paspoortnummers.";
            Ensure               = "Present";
            Identity             = "ba4e7456-55a9-4d89-9140-c33673553526";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Sweden Passport Number";
        }
        EXODataClassification "EXODataClassification-86f7628b-e0f4-4dc3-9fbc-e4300e4c7d78"
        {
            Credential           = $Credscredential;
            Description          = "Detects Lithuania Driver's License Number";
            Ensure               = "Present";
            Identity             = "86f7628b-e0f4-4dc3-9fbc-e4300e4c7d78";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Lithuania Driver's License Number";
        }
        EXODataClassification "EXODataClassification-1ca46b29-76f5-4f46-9383-cfa15e91048f"
        {
            Credential           = $Credscredential;
            Description          = "Detects India Unique Identification (Aadhaar) numbers";
            Ensure               = "Present";
            Identity             = "1ca46b29-76f5-4f46-9383-cfa15e91048f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "India Unique Identification (Aadhaar) Number";
        }
        EXODataClassification "EXODataClassification-6c4f2fef-56e1-4c00-8093-88d7a01cf460"
        {
            Credential           = $Credscredential;
            Description          = "Detects Denmark Personal Identification numbers";
            Ensure               = "Present";
            Identity             = "6c4f2fef-56e1-4c00-8093-88d7a01cf460";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Denmark Personal Identification Number";
        }
        EXODataClassification "EXODataClassification-82568215-1da1-46d3-874a-d2294d81b5ac"
        {
            Credential           = $Credscredential;
            Description          = "Detects Greece National ID Cards";
            Ensure               = "Present";
            Identity             = "82568215-1da1-46d3-874a-d2294d81b5ac";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Greece National ID Card";
        }
        EXODataClassification "EXODataClassification-854b36b3-a388-4ac8-a4ec-677c2b5e4356"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malta Identity Card Number";
            Ensure               = "Present";
            Identity             = "854b36b3-a388-4ac8-a4ec-677c2b5e4356";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malta Identity Card Number";
        }
        EXODataClassification "EXODataClassification-019b39dd-8c25-4765-91a3-d9c6baf3c3b3"
        {
            Credential           = $Credscredential;
            Description          = "Detects Philippines Unified Multi-Purpose ID numbers";
            Ensure               = "Present";
            Identity             = "019b39dd-8c25-4765-91a3-d9c6baf3c3b3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Philippines Unified Multi-Purpose ID Number";
        }
        EXODataClassification "EXODataClassification-1a97fc2b-dd2f-48f1-bc4e-2ddf25813956"
        {
            Credential           = $Credscredential;
            Description          = "Detects New Zealand bank account number";
            Ensure               = "Present";
            Identity             = "1a97fc2b-dd2f-48f1-bc4e-2ddf25813956";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "New Zealand bank account number";
        }
        EXODataClassification "EXODataClassification-4fd58d22-af28-4451-b18a-6f722430a56d"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Tax Identification Number";
            Ensure               = "Present";
            Identity             = "4fd58d22-af28-4451-b18a-6f722430a56d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-76e83b3b-01ee-4530-aced-e667a6609f49"
        {
            Credential           = $Credscredential;
            Description          = "Detects Australian Business Number";
            Ensure               = "Present";
            Identity             = "76e83b3b-01ee-4530-aced-e667a6609f49";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Australian Business Number";
        }
        EXODataClassification "EXODataClassification-853a8051-ad90-417c-9345-c73ac0adc1c3"
        {
            Credential           = $Credscredential;
            Description          = "Detects UAE Identity Card numbers";
            Ensure               = "Present";
            Identity             = "853a8051-ad90-417c-9345-c73ac0adc1c3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "UAE Identity Card Number";
        }
        EXODataClassification "EXODataClassification-356fa104-f9ac-4aff-a0e4-2e6e65ea06c4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Cyprus Driver's License Number";
            Ensure               = "Present";
            Identity             = "356fa104-f9ac-4aff-a0e4-2e6e65ea06c4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Cyprus Driver's License Number";
        }
        EXODataClassification "EXODataClassification-9bc2069e-76df-4ff9-ac02-2f519469e236"
        {
            Credential           = $Credscredential;
            Description          = "Detects France Health Insurance Number";
            Ensure               = "Present";
            Identity             = "9bc2069e-76df-4ff9-ac02-2f519469e236";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Health Insurance Number";
        }
        EXODataClassification "EXODataClassification-cd6d3786-8ec3-4524-a2cf-1e0095379171"
        {
            Credential           = $Credscredential;
            Description          = "Detects Lithuania Personal Code";
            Ensure               = "Present";
            Identity             = "cd6d3786-8ec3-4524-a2cf-1e0095379171";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Lithuania Personal Code";
        }
        EXODataClassification "EXODataClassification-48269fec-05ea-46ea-b326-f5623a58c6e9"
        {
            Credential           = $Credscredential;
            Description          = "Detects Taiwan Resident Certificates (ARC/TARC)";
            Ensure               = "Present";
            Identity             = "48269fec-05ea-46ea-b326-f5623a58c6e9";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Taiwan Resident Certificate (ARC/TARC)";
        }
        EXODataClassification "EXODataClassification-62ea2a27-798e-4de3-a31f-a54c5d02ff37"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malaysia Passport Number";
            Ensure               = "Present";
            Identity             = "62ea2a27-798e-4de3-a31f-a54c5d02ff37";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malaysia Passport Number";
        }
        EXODataClassification "EXODataClassification-7d7a729d-32d8-4204-8d01-d5e6a6c25581"
        {
            Credential           = $Credscredential;
            Description          = "Detects Croatia Passport Number";
            Ensure               = "Present";
            Identity             = "7d7a729d-32d8-4204-8d01-d5e6a6c25581";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Croatia Passport Number";
        }
        EXODataClassification "EXODataClassification-4C7BFC34-8DD1-421D-8FB7-6C6182C2AF03"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nationale id-nummers voor Taiwan";
            Ensure               = "Present";
            Identity             = "4C7BFC34-8DD1-421D-8FB7-6C6182C2AF03";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Taiwan National ID";
        }
        EXODataClassification "EXODataClassification-a3bdaa4a-8371-4735-8fa5-56ee0fb4afc4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malta Driver's License Number";
            Ensure               = "Present";
            Identity             = "a3bdaa4a-8371-4735-8fa5-56ee0fb4afc4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malta Driver's License Number";
        }
        EXODataClassification "EXODataClassification-3da0b024-4c08-406b-9f9e-de96accd0209"
        {
            Credential           = $Credscredential;
            Description          = "Detects South Korea Driver's License numbers";
            Ensure               = "Present";
            Identity             = "3da0b024-4c08-406b-9f9e-de96accd0209";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "South Korea Driver's License Number";
        }
        EXODataClassification "EXODataClassification-68948b27-803d-41e4-adf1-13e05eb541bb"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovenia Unique Master Citizen Number";
            Ensure               = "Present";
            Identity             = "68948b27-803d-41e4-adf1-13e05eb541bb";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovenia Unique Master Citizen Number";
        }
        EXODataClassification "EXODataClassification-9b58b5cd-5e90-4df6-b34f-1ebcc88ceae4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Brazil Legal Entity (CNPJ) numbers";
            Ensure               = "Present";
            Identity             = "9b58b5cd-5e90-4df6-b34f-1ebcc88ceae4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Brazil Legal Entity Number (CNPJ)";
        }
        EXODataClassification "EXODataClassification-1ff28b4d-40f2-49e9-b677-9606a88e2bca"
        {
            Credential           = $Credscredential;
            Description          = "Detects Poland Tax Identification Number";
            Ensure               = "Present";
            Identity             = "1ff28b4d-40f2-49e9-b677-9606a88e2bca";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Poland Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-277cfa4b-6eaa-4a1b-9492-099dec849971"
        {
            Credential           = $Credscredential;
            Description          = "Detects Swiss Social Security Number (AHV)";
            Ensure               = "Present";
            Identity             = "277cfa4b-6eaa-4a1b-9492-099dec849971";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Swiss Social Security Number AHV";
        }
        EXODataClassification "EXODataClassification-98a95812-6203-451a-a220-d39870ebef0e"
        {
            Credential           = $Credscredential;
            Description          = "Detects Denmark Driver's License Number";
            Ensure               = "Present";
            Identity             = "98a95812-6203-451a-a220-d39870ebef0e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Denmark Driver's License Number";
        }
        EXODataClassification "EXODataClassification-139acba0-a5bc-4fbb-876d-f7a493ae8a40"
        {
            Credential           = $Credscredential;
            Description          = "Detects Sweden Tax Identification Number";
            Ensure               = "Present";
            Identity             = "139acba0-a5bc-4fbb-876d-f7a493ae8a40";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Sweden Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-cead390a-dd83-4856-9751-fb6dc98c34da"
        {
            Credential           = $Credscredential;
            Description          = "Detects Singapore National Registration Identity Card (NRIC) numbers";
            Ensure               = "Present";
            Identity             = "cead390a-dd83-4856-9751-fb6dc98c34da";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Singapore National Registration Identity Card (NRIC) Number";
        }
        EXODataClassification "EXODataClassification-9f5a721c-2fd2-446a-a27e-0c02fbe4630c"
        {
            Credential           = $Credscredential;
            Description          = "Detects India GST number";
            Ensure               = "Present";
            Identity             = "9f5a721c-2fd2-446a-a27e-0c02fbe4630c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "India GST Number";
        }
        EXODataClassification "EXODataClassification-7e65eb47-cdf9-4f52-8f90-2a27d5ee67e3"
        {
            Credential           = $Credscredential;
            Description          = "Detects Greece Passport Number";
            Ensure               = "Present";
            Identity             = "7e65eb47-cdf9-4f52-8f90-2a27d5ee67e3";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Greece Passport Number";
        }
        EXODataClassification "EXODataClassification-E3AAF206-4297-412F-9E06-BA8487E22456"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nationale id-nummers voor Polen.";
            Ensure               = "Present";
            Identity             = "E3AAF206-4297-412F-9E06-BA8487E22456";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Poland National ID (PESEL)";
        }
        EXODataClassification "EXODataClassification-111b5e63-6f4e-47c6-99bc-dd95625a5acf"
        {
            Credential           = $Credscredential;
            Description          = "Detects UAE passport numbers";
            Ensure               = "Present";
            Identity             = "111b5e63-6f4e-47c6-99bc-dd95625a5acf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "UAE Passport Number";
        }
        EXODataClassification "EXODataClassification-03fcf763-27c2-49ed-9422-2641c6c895c9"
        {
            Credential           = $Credscredential;
            Description          = "Detects Latvia Personal Code";
            Ensure               = "Present";
            Identity             = "03fcf763-27c2-49ed-9422-2641c6c895c9";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Latvia Personal Code";
        }
        EXODataClassification "EXODataClassification-e577372f-c42e-47a0-9d85-bebed1c237d4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Germany Identity Card numbers";
            Ensure               = "Present";
            Identity             = "e577372f-c42e-47a0-9d85-bebed1c237d4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Germany Identity Card Number";
        }
        EXODataClassification "EXODataClassification-100d58b1-0a35-4fb1-aa89-e4a86fb53fcc"
        {
            Credential           = $Credscredential;
            Description          = "Detects Bulgaria Uniform Civil Number";
            Ensure               = "Present";
            Identity             = "100d58b1-0a35-4fb1-aa89-e4a86fb53fcc";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Bulgaria Uniform Civil Number";
        }
        EXODataClassification "EXODataClassification-db177eb2-8811-4842-bffc-128c14aa219f"
        {
            Credential           = $Credscredential;
            Description          = "Detects Germany Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "db177eb2-8811-4842-bffc-128c14aa219f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Germany Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-51da8171-da70-4cc1-9d65-055a59ca4f83"
        {
            Credential           = $Credscredential;
            Description          = "Detects Estonia Driver's License Number";
            Ensure               = "Present";
            Identity             = "51da8171-da70-4cc1-9d65-055a59ca4f83";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Estonia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-8e6251b9-47b4-40e8-a42b-0f80876be192"
        {
            Credential           = $Credscredential;
            Description          = "Detects Spain DNI";
            Ensure               = "Present";
            Identity             = "8e6251b9-47b4-40e8-a42b-0f80876be192";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Spain DNI";
        }
        EXODataClassification "EXODataClassification-4081ae73-c4ec-405d-932c-8b36ae35b20c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Singapore Passport numbers";
            Ensure               = "Present";
            Identity             = "4081ae73-c4ec-405d-932c-8b36ae35b20c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Singapore Passport Number";
        }
        EXODataClassification "EXODataClassification-3356946c-6bb7-449b-b253-6ffa419c0ce7"
        {
            Credential           = $Credscredential;
            Description          = "Detects International Classification of Diseases, tenth revision, clinical modification (ICD-10-CM)";
            Ensure               = "Present";
            Identity             = "3356946c-6bb7-449b-b253-6ffa419c0ce7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "International Classification of Diseases (ICD-10-CM)";
        }
        EXODataClassification "EXODataClassification-39811019-4750-445f-b26d-4c0e6c431544"
        {
            Credential           = $Credscredential;
            Description          = "Detects Italy Passport Number";
            Ensure               = "Present";
            Identity             = "39811019-4750-445f-b26d-4c0e6c431544";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Italy Passport Number";
        }
        EXODataClassification "EXODataClassification-25E64989-ED5D-40CA-A939-6C14183BB7BF"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert nummers van Poolse identiteitskaarten.";
            Ensure               = "Present";
            Identity             = "25E64989-ED5D-40CA-A939-6C14183BB7BF";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Poland Identity Card";
        }
        EXODataClassification "EXODataClassification-646d643f-5228-4408-acc8-f2e81a6df897"
        {
            Credential           = $Credscredential;
            Description          = "Detects India Voter Id Card";
            Ensure               = "Present";
            Identity             = "646d643f-5228-4408-acc8-f2e81a6df897";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "India Voter Id Card";
        }
        EXODataClassification "EXODataClassification-65372402-3131-4f1e-9983-4439841d1f15"
        {
            Credential           = $Credscredential;
            Description          = "Detects Portugal Tax Identification Number";
            Ensure               = "Present";
            Identity             = "65372402-3131-4f1e-9983-4439841d1f15";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Portugal Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-40e64bd9-55f3-4a09-9bd6-1db18dced9dd"
        {
            Credential           = $Credscredential;
            Description          = "Detects Cyprus Tax Identification Number";
            Ensure               = "Present";
            Identity             = "40e64bd9-55f3-4a09-9bd6-1db18dced9dd";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Cyprus Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-9e0eaf79-ff20-4ffb-b3e4-e7368d5db6ff"
        {
            Credential           = $Credscredential;
            Description          = "Detects Japanese My Number Corporate";
            Ensure               = "Present";
            Identity             = "9e0eaf79-ff20-4ffb-b3e4-e7368d5db6ff";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japanese My Number Corporate";
        }
        EXODataClassification "EXODataClassification-9d31c46b-6e6b-444c-aeb1-6dd7e604bb24"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungary Driver's License Number";
            Ensure               = "Present";
            Identity             = "9d31c46b-6e6b-444c-aeb1-6dd7e604bb24";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungary Driver's License Number";
        }
        EXODataClassification "EXODataClassification-ec830c63-65f4-45d0-9d8c-910dc8334b20"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malta Tax ID Number";
            Ensure               = "Present";
            Identity             = "ec830c63-65f4-45d0-9d8c-910dc8334b20";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malta Tax ID Number";
        }
        EXODataClassification "EXODataClassification-1cdb674d-c19a-4fcf-9f4b-7f56cc87345a"
        {
            Credential           = $Credscredential;
            Description          = "Detects Ireland Personal Public Service (PPS) numbers";
            Ensure               = "Present";
            Identity             = "1cdb674d-c19a-4fcf-9f4b-7f56cc87345a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Ireland Personal Public Service (PPS) Number";
        }
        EXODataClassification "EXODataClassification-d24e32a4-c0bb-4ba8-899d-6303b95742d9"
        {
            Credential           = $Credscredential;
            Description          = "Detects SSNs or equivalent IDs issued by countries in the European Union (EU).";
            Ensure               = "Present";
            Identity             = "d24e32a4-c0bb-4ba8-899d-6303b95742d9";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU Social Security Number (SSN) or Equivalent ID";
        }
        EXODataClassification "EXODataClassification-6fa57f91-314a-4561-8248-7ab921957448"
        {
            Credential           = $Credscredential;
            Description          = "Detects Philippines Passport numbers";
            Ensure               = "Present";
            Identity             = "6fa57f91-314a-4561-8248-7ab921957448";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Philippines Passport Number";
        }
        EXODataClassification "EXODataClassification-680788a3-53b6-455a-b891-c38cd76dc917"
        {
            Credential           = $Credscredential;
            Description          = "Detects India Driver's License Number";
            Ensure               = "Present";
            Identity             = "680788a3-53b6-455a-b891-c38cd76dc917";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "India Driver's License Number";
        }
        EXODataClassification "EXODataClassification-682f18ce-44eb-482b-8198-2bcb96a0761e"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Driver's License Number";
            Ensure               = "Present";
            Identity             = "682f18ce-44eb-482b-8198-2bcb96a0761e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Driver's License Number";
        }
        EXODataClassification "EXODataClassification-fc87b421-f437-4f8b-b739-29a735ead0d9"
        {
            Credential           = $Credscredential;
            Description          = "Detects Polish REGON Number";
            Ensure               = "Present";
            Identity             = "fc87b421-f437-4f8b-b739-29a735ead0d9";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Polish REGON Number";
        }
        EXODataClassification "EXODataClassification-6247fbea-ab80-4be5-8233-308b7c031401"
        {
            Credential           = $Credscredential;
            Description          = "Detects Netherlands Driver's License Number";
            Ensure               = "Present";
            Identity             = "6247fbea-ab80-4be5-8233-308b7c031401";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Netherlands Driver's License Number";
        }
        EXODataClassification "EXODataClassification-949121e6-ad9f-4379-8731-710342baea78"
        {
            Credential           = $Credscredential;
            Description          = "Detects France Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "949121e6-ad9f-4379-8731-710342baea78";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "France Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-e01bccd9-eb4d-414f-ace1-e9b6a4c4a2ca"
        {
            Credential           = $Credscredential;
            Description          = "Detects Ireland Driver's License Number";
            Ensure               = "Present";
            Identity             = "e01bccd9-eb4d-414f-ace1-e9b6a4c4a2ca";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Ireland Driver's License Number";
        }
        EXODataClassification "EXODataClassification-ad4a8116-0db8-439a-b545-6d967642f0ec"
        {
            Credential           = $Credscredential;
            Description          = "Detects U.K. Unique Taxpayer Reference Number";
            Ensure               = "Present";
            Identity             = "ad4a8116-0db8-439a-b545-6d967642f0ec";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.K. Unique Taxpayer Reference Number";
        }
        EXODataClassification "EXODataClassification-c5f54253-ef7e-44f6-a578-440ed67e946d"
        {
            Credential           = $Credscredential;
            Description          = "Detects Netherlands Citizen's Service (BSN) numbers";
            Ensure               = "Present";
            Identity             = "c5f54253-ef7e-44f6-a578-440ed67e946d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Netherlands Citizen's Service (BSN) Number";
        }
        EXODataClassification "EXODataClassification-b8fe86d1-c056-453b-bfaa-9fe698699ecc"
        {
            Credential           = $Credscredential;
            Description          = "Detects driver's license numbers issued by countries in the European Union (EU).";
            Ensure               = "Present";
            Identity             = "b8fe86d1-c056-453b-bfaa-9fe698699ecc";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU Driver's License Number";
        }
        EXODataClassification "EXODataClassification-d1685ac3-1d3a-40f8-8198-32ef5669c7a5"
        {
            Credential           = $Credscredential;
            Description          = "Detects Finland Passport Number";
            Ensure               = "Present";
            Identity             = "d1685ac3-1d3a-40f8-8198-32ef5669c7a5";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Finland Passport Number";
        }
        EXODataClassification "EXODataClassification-52b1b60e-a4be-4b5a-a67b-6f9bbb7811da"
        {
            Credential           = $Credscredential;
            Description          = "Detects Qatari ID Card numbers";
            Ensure               = "Present";
            Identity             = "52b1b60e-a4be-4b5a-a67b-6f9bbb7811da";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Qatari ID Card Number";
        }
        EXODataClassification "EXODataClassification-66d39258-94c2-43b2-804b-aa312258e54b"
        {
            Credential           = $Credscredential;
            Description          = "Detects Bulgaria Driver's License Number";
            Ensure               = "Present";
            Identity             = "66d39258-94c2-43b2-804b-aa312258e54b";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Bulgaria Driver's License Number";
        }
        EXODataClassification "EXODataClassification-98da8e66-7299-4ebd-9f82-c871ab37d3ef"
        {
            Credential           = $Credscredential;
            Description          = "Detects Japanese My Number Personal";
            Ensure               = "Present";
            Identity             = "98da8e66-7299-4ebd-9f82-c871ab37d3ef";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Japanese My Number Personal";
        }
        EXODataClassification "EXODataClassification-84bffa3a-d805-4788-a613-b1e4df3804cf"
        {
            Credential           = $Credscredential;
            Description          = "Detects Luxembourg National Identification Number (Non-natural persons)";
            Ensure               = "Present";
            Identity             = "84bffa3a-d805-4788-a613-b1e4df3804cf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Luxembourg National Identification Number (Non-natural persons)";
        }
        EXODataClassification "EXODataClassification-d5bc089a-f2ee-433d-a6b1-5c253051d6f2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovenia Driver's License Number";
            Ensure               = "Present";
            Identity             = "d5bc089a-f2ee-433d-a6b1-5c253051d6f2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovenia Driver's License Number";
        }
        EXODataClassification "EXODataClassification-43316a89-9880-40cf-b980-04bc7eefcec5"
        {
            Credential           = $Credscredential;
            Description          = "Detects Germany Tax Identification Number";
            Ensure               = "Present";
            Identity             = "43316a89-9880-40cf-b980-04bc7eefcec5";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Germany Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-91a7ece2-add4-4986-9a15-c84544d81ecd"
        {
            Credential           = $Credscredential;
            Description          = "Detects Portugal Citizen Card numbers";
            Ensure               = "Present";
            Identity             = "91a7ece2-add4-4986-9a15-c84544d81ecd";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Portugal Citizen Card Number";
        }
        EXODataClassification "EXODataClassification-0f587d92-eb28-44a9-bd1c-90f2892b47aa"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure DocumentDB/CosmosDB authentication key in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "0f587d92-eb28-44a9-bd1c-90f2892b47aa";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure DocumentDB Auth Key";
        }
        EXODataClassification "EXODataClassification-86b40d3b-d8ea-4c36-aab0-ef9416a6769c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Czech Driver's License Number";
            Ensure               = "Present";
            Identity             = "86b40d3b-d8ea-4c36-aab0-ef9416a6769c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Czech Driver's License Number";
        }
        EXODataClassification "EXODataClassification-26a8cc07-2283-4a2a-ab1d-4ab643c4c67f"
        {
            Credential           = $Credscredential;
            Description          = "Detects Italy Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "26a8cc07-2283-4a2a-ab1d-4ab643c4c67f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Italy Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-01f42a64-eba7-4892-a67b-398237e4ade2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Netherlands Tax Identification Number";
            Ensure               = "Present";
            Identity             = "01f42a64-eba7-4892-a67b-398237e4ade2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Netherlands Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-70088720-90dd-47f5-805e-5525f3567391"
        {
            Credential           = $Credscredential;
            Description          = "Detects Sweden Driver's License Number";
            Ensure               = "Present";
            Identity             = "70088720-90dd-47f5-805e-5525f3567391";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Sweden Driver's License Number";
        }
        EXODataClassification "EXODataClassification-d17a57de-9fa5-4e9f-85d3-85c26d89686e"
        {
            Credential           = $Credscredential;
            Description          = "Detects Spain Passport Number";
            Ensure               = "Present";
            Identity             = "d17a57de-9fa5-4e9f-85d3-85c26d89686e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Spain Passport Number";
        }
        EXODataClassification "EXODataClassification-31983b6d-db95-4eb2-a630-b44bd091968d"
        {
            Credential           = $Credscredential;
            Description          = "Detects Croatia Personal Identification (OIB) numbers";
            Ensure               = "Present";
            Identity             = "31983b6d-db95-4eb2-a630-b44bd091968d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Croatia Personal Identification (OIB) Number";
        }
        EXODataClassification "EXODataClassification-0b34bec3-d5d6-4974-b7b0-dcdb5c90c29d"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure IoT Connection String in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "0b34bec3-d5d6-4974-b7b0-dcdb5c90c29d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure IoT Connection String";
        }
        EXODataClassification "EXODataClassification-7a2200b5-aacf-4e3c-ab36-136d3e68b7da"
        {
            Credential           = $Credscredential;
            Description          = "Detects Greece Driver's License Number";
            Ensure               = "Present";
            Identity             = "7a2200b5-aacf-4e3c-ab36-136d3e68b7da";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Greece Driver's License Number";
        }
        EXODataClassification "EXODataClassification-85b5b3c3-f2de-4ae8-ac46-fd3cb38bf9ed"
        {
            Credential           = $Credscredential;
            Description          = "Detects Belgium Value Added Tax Number";
            Ensure               = "Present";
            Identity             = "85b5b3c3-f2de-4ae8-ac46-fd3cb38bf9ed";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Belgium Value Added Tax Number";
        }
        EXODataClassification "EXODataClassification-e47b071e-c352-4d70-8241-8c215ad65505"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovenia Tax Identification Number";
            Ensure               = "Present";
            Identity             = "e47b071e-c352-4d70-8241-8c215ad65505";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovenia Tax Identification Number";
        }
        EXODataClassification "EXODataClassification-977f1e5a-2c33-4bcc-b516-95bb275cff23"
        {
            Credential           = $Credscredential;
            Description          = "Detects Portugal Driver's License Number";
            Ensure               = "Present";
            Identity             = "977f1e5a-2c33-4bcc-b516-95bb275cff23";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Portugal Driver's License Number";
        }
        EXODataClassification "EXODataClassification-e39b03f4-50ea-41ae-af7a-a4b9539596ad"
        {
            Credential           = $Credscredential;
            Description          = "Detects Greece Social Security Number (AMKA)";
            Ensure               = "Present";
            Identity             = "e39b03f4-50ea-41ae-af7a-a4b9539596ad";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Greece Social Security Number (AMKA)";
        }
        EXODataClassification "EXODataClassification-e2adf7cb-8ea6-4048-a2ed-d89eb65f2780"
        {
            Credential           = $Credscredential;
            Description          = "Detects South Africa Identification numbers";
            Ensure               = "Present";
            Identity             = "e2adf7cb-8ea6-4048-a2ed-d89eb65f2780";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "South Africa Identification Number";
        }
        EXODataClassification "EXODataClassification-095a7e6c-efd8-46d5-af7b-5298d53a49fc"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure Azure Redis Cache Connection String in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "095a7e6c-efd8-46d5-af7b-5298d53a49fc";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure Redis Cache Connection String";
        }
        EXODataClassification "EXODataClassification-89daf717-1544-4860-9a2e-fc9166dd8852"
        {
            Credential           = $Credscredential;
            Description          = "Detects Luxembourg Driver's License Number";
            Ensure               = "Present";
            Identity             = "89daf717-1544-4860-9a2e-fc9166dd8852";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Luxembourg Driver's License Number";
        }
        EXODataClassification "EXODataClassification-1924b377-d287-49c9-a737-cfe7a8a2615a"
        {
            Credential           = $Credscredential;
            Description          = "Detects New Zealand Driver License Number";
            Ensure               = "Present";
            Identity             = "1924b377-d287-49c9-a737-cfe7a8a2615a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "New Zealand Driver License Number";
        }
        EXODataClassification "EXODataClassification-d5a82922-b501-4f40-8868-341321146aa2"
        {
            Credential           = $Credscredential;
            Description          = "Detects Spain Driver's License Number";
            Ensure               = "Present";
            Identity             = "d5a82922-b501-4f40-8868-341321146aa2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Spain Driver's License Number";
        }
        EXODataClassification "EXODataClassification-1c96ae4e-303b-447d-86c7-77113ac266bf"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Passport Number";
            Ensure               = "Present";
            Identity             = "1c96ae4e-303b-447d-86c7-77113ac266bf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Passport Number";
        }
        EXODataClassification "EXODataClassification-cb725748-0f69-4282-8a03-e9b222a10a18"
        {
            Credential           = $Credscredential;
            Description          = "Detects South Korea passport numbers";
            Ensure               = "Present";
            Identity             = "cb725748-0f69-4282-8a03-e9b222a10a18";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "South Korea Passport Number";
        }
        EXODataClassification "EXODataClassification-c7bc98e8-551a-4c35-a92d-d2c8cda714a7"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure Storage Account in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "c7bc98e8-551a-4c35-a92d-d2c8cda714a7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure Storage Account Key";
        }
        EXODataClassification "EXODataClassification-24d51f99-ee9e-4060-a077-cae58cab1ee4"
        {
            Credential           = $Credscredential;
            Description          = "Detects Poland Driver's License Number";
            Ensure               = "Present";
            Identity             = "24d51f99-ee9e-4060-a077-cae58cab1ee4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Poland Driver's License Number";
        }
        EXODataClassification "EXODataClassification-20f3c48d-4ac1-4cd2-86bd-34ecc1826e9d"
        {
            Credential           = $Credscredential;
            Description          = "Detects New Zealand Social Welfare Number";
            Ensure               = "Present";
            Identity             = "20f3c48d-4ac1-4cd2-86bd-34ecc1826e9d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "New Zealand Social Welfare Number";
        }
        EXODataClassification "EXODataClassification-aaf661ed-29ec-426d-8bf9-880cad298ebb"
        {
            Credential           = $Credscredential;
            Description          = "Detects Luxembourg National Identification Number (Natural persons)";
            Ensure               = "Present";
            Identity             = "aaf661ed-29ec-426d-8bf9-880cad298ebb";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Luxembourg National Identification Number (Natural persons)";
        }
        EXODataClassification "EXODataClassification-a7dd5e5f-e7f9-4626-a2c6-86a8cb6830d2"
        {
            Credential           = $Credscredential;
            Description          = "Detects IP Address";
            Ensure               = "Present";
            Identity             = "a7dd5e5f-e7f9-4626-a2c6-86a8cb6830d2";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "IP Address v4";
        }
        EXODataClassification "EXODataClassification-61f7073a-509e-425b-a754-bc01bb5d5b8c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Estonia Passport Number";
            Ensure               = "Present";
            Identity             = "61f7073a-509e-425b-a754-bc01bb5d5b8c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Estonia Passport Number";
        }
        EXODataClassification "EXODataClassification-419f449f-6d9d-4be1-a154-b531f7a91b41"
        {
            Credential           = $Credscredential;
            Description          = "Detects national identification numbers issued by countries in the European Union (EU).";
            Ensure               = "Present";
            Identity             = "419f449f-6d9d-4be1-a154-b531f7a91b41";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU National Identification Number";
        }
        EXODataClassification "EXODataClassification-b5511ace-2fd8-4ae4-b6fc-c7c6e4689e3c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Romania Driver's License Number";
            Ensure               = "Present";
            Identity             = "b5511ace-2fd8-4ae4-b6fc-c7c6e4689e3c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Romania Driver's License Number";
        }
        EXODataClassification "EXODataClassification-3f691089-7413-4926-ab3b-3c5ea8a1c17e"
        {
            Credential           = $Credscredential;
            Description          = "Detects IP Address";
            Ensure               = "Present";
            Identity             = "3f691089-7413-4926-ab3b-3c5ea8a1c17e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "IP Address v6";
        }
        EXODataClassification "EXODataClassification-080a52fd-a7bc-431e-b54d-51f08f59db11"
        {
            Credential           = $Credscredential;
            Description          = "Detects Portugal Passport Number";
            Ensure               = "Present";
            Identity             = "080a52fd-a7bc-431e-b54d-51f08f59db11";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Portugal Passport Number";
        }
        EXODataClassification "EXODataClassification-e09c07d3-66e5-4783-989d-49ac62748f5f"
        {
            Credential           = $Credscredential;
            Description          = "Detects Tax Identification Numbers issued by countries in the European Union (EU).";
            Ensure               = "Present";
            Identity             = "e09c07d3-66e5-4783-989d-49ac62748f5f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU Tax Identification Number (TIN)";
        }
        EXODataClassification "EXODataClassification-bb3b27a3-79bd-4ac4-81a7-f9fca3c7d1a7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Finland Driver's License Number";
            Ensure               = "Present";
            Identity             = "bb3b27a3-79bd-4ac4-81a7-f9fca3c7d1a7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Finland Driver's License Number";
        }
        EXODataClassification "EXODataClassification-238e1f08-d80e-4793-af33-9b57918335b7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovakia Passport Number";
            Ensure               = "Present";
            Identity             = "238e1f08-d80e-4793-af33-9b57918335b7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovakia Passport Number";
        }
        EXODataClassification "EXODataClassification-fa3f9c74-ee07-4c52-b5f2-085d6b2c0ec4"
        {
            Credential           = $Credscredential;
            Description          = "Detects International Classification of Diseases, ninth revision, clinical modification (ICD-9-CM)";
            Ensure               = "Present";
            Identity             = "fa3f9c74-ee07-4c52-b5f2-085d6b2c0ec4";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "International Classification of Diseases (ICD-9-CM)";
        }
        EXODataClassification "EXODataClassification-d7b1315b-21ca-4774-a32a-596010ff78fd"
        {
            Credential           = $Credscredential;
            Description          = "Detects Belgium Passport Number";
            Ensure               = "Present";
            Identity             = "d7b1315b-21ca-4774-a32a-596010ff78fd";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Belgium Passport Number";
        }
        EXODataClassification "EXODataClassification-a2130f27-9ee2-4103-84f9-a6b1ee7d0cbf"
        {
            Credential           = $Credscredential;
            Description          = "Detects Ireland Passport Number";
            Ensure               = "Present";
            Identity             = "a2130f27-9ee2-4103-84f9-a6b1ee7d0cbf";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Ireland Passport Number";
        }
        EXODataClassification "EXODataClassification-75f4cc8a-a68e-49e5-89ce-fa8f03d286a5"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure publish setting user password in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "75f4cc8a-a68e-49e5-89ce-fa8f03d286a5";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure Publish Setting Password";
        }
        EXODataClassification "EXODataClassification-9193e2e8-7f8c-43c1-a274-ac40d651936f"
        {
            Credential           = $Credscredential;
            Description          = "Detects Cyprus Passport Number";
            Ensure               = "Present";
            Identity             = "9193e2e8-7f8c-43c1-a274-ac40d651936f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Cyprus Passport Number";
        }
        EXODataClassification "EXODataClassification-7ff41bd0-5419-4523-91d6-383b3a37f084"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure Storage Account Key (Generic) in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "7ff41bd0-5419-4523-91d6-383b3a37f084";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure Storage Account Key (Generic)";
        }
        EXODataClassification "EXODataClassification-23ae25ec-cc28-421b-b77a-3054eadf1ede"
        {
            Credential           = $Credscredential;
            Description          = "Detects Latvia Passport Number";
            Ensure               = "Present";
            Identity             = "23ae25ec-cc28-421b-b77a-3054eadf1ede";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Latvia Passport Number";
        }
        EXODataClassification "EXODataClassification-e76b6205-d3cb-46f2-bd63-c90153f2f97d"
        {
            Credential           = $Credscredential;
            Description          = "Found SQL Server Connection String in document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "e76b6205-d3cb-46f2-bd63-c90153f2f97d";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "SQL Server Connection String";
        }
        EXODataClassification "EXODataClassification-1b79900f-047b-4c3f-846f-7d73b5534bce"
        {
            Credential           = $Credscredential;
            Description          = "Detects Lithuania Passport Number";
            Ensure               = "Present";
            Identity             = "1b79900f-047b-4c3f-846f-7d73b5534bce";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Lithuania Passport Number";
        }
        EXODataClassification "EXODataClassification-ce1a126d-186f-4700-8c0c-486157b953fd"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure IAAS Database Connection String or Azure SQL Connection String in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "ce1a126d-186f-4700-8c0c-486157b953fd";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure IAAS Database Connection String and Azure SQL Connection String";
        }
        EXODataClassification "EXODataClassification-81d5c027-bed9-4421-91a0-3b2e55b3eb85"
        {
            Credential           = $Credscredential;
            Description          = "Detects Luxembourg Passport Number";
            Ensure               = "Present";
            Identity             = "81d5c027-bed9-4421-91a0-3b2e55b3eb85";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Luxembourg Passport Number";
        }
        EXODataClassification "EXODataClassification-4d235014-e564-47f4-a6fb-6ebb4a826834"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure SAS key in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "4d235014-e564-47f4-a6fb-6ebb4a826834";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure SAS";
        }
        EXODataClassification "EXODataClassification-61786727-bafd-45f6-94d9-888d815e228e"
        {
            Credential           = $Credscredential;
            Description          = "Detects Netherlands Passport Number";
            Ensure               = "Present";
            Identity             = "61786727-bafd-45f6-94d9-888d815e228e";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Netherlands Passport Number";
        }
        EXODataClassification "EXODataClassification-b9a6578f-a83f-4fcd-bf44-2130bae49a6f"
        {
            Credential           = $Credscredential;
            Description          = "Found Azure Service Bus Connection String key in the document. Recommendation Action: Validate whether the file contains real secrets. If so, remove and roll the current secrets. Store new secrets in an approved store. For more information, please visit https://aka.ms/CEP";
            Ensure               = "Present";
            Identity             = "b9a6578f-a83f-4fcd-bf44-2130bae49a6f";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Azure Service Bus Connection String";
        }
        EXODataClassification "EXODataClassification-6896a906-86c9-4d19-a2da-6e43ccd19b7b"
        {
            Credential           = $Credscredential;
            Description          = "Detects Austria Social Security Number";
            Ensure               = "Present";
            Identity             = "6896a906-86c9-4d19-a2da-6e43ccd19b7b";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Austria Social Security Number";
        }
        EXODataClassification "EXODataClassification-f7172b82-c588-4216-845e-4e54e397f29a"
        {
            Credential           = $Credscredential;
            Description          = "Detects Bulgaria Passport Number";
            Ensure               = "Present";
            Identity             = "f7172b82-c588-4216-845e-4e54e397f29a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Bulgaria Passport Number";
        }
        EXODataClassification "EXODataClassification-21883626-6245-4f3d-9b61-5cbb43e625ee"
        {
            Credential           = $Credscredential;
            Description          = "Detects passport numbers from countries in the European Union (EU).";
            Ensure               = "Present";
            Identity             = "21883626-6245-4f3d-9b61-5cbb43e625ee";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "EU Passport Number";
        }
        EXODataClassification "EXODataClassification-7bcd8ce8-5e92-4bbe-bc92-fa669f0369fa"
        {
            Credential           = $Credscredential;
            Description          = "Detects Czech Republic Passport Number";
            Ensure               = "Present";
            Identity             = "7bcd8ce8-5e92-4bbe-bc92-fa669f0369fa";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Czech Republic Passport Number";
        }
        EXODataClassification "EXODataClassification-235b7976-7bbe-4df5-bb40-08678e749d1a"
        {
            Credential           = $Credscredential;
            Description          = "Detects Slovenia Passport Number";
            Ensure               = "Present";
            Identity             = "235b7976-7bbe-4df5-bb40-08678e749d1a";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Slovenia Passport Number";
        }
        EXODataClassification "EXODataClassification-5b483910-9aa7-4c99-9917-f4001464bda7"
        {
            Credential           = $Credscredential;
            Description          = "Detects Hungary Passport Number";
            Ensure               = "Present";
            Identity             = "5b483910-9aa7-4c99-9917-f4001464bda7";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Hungary Passport Number";
        }
        EXODataClassification "EXODataClassification-b2b21198-48f9-4d13-b2a5-03969bff0fb8"
        {
            Credential           = $Credscredential;
            Description          = "Detects Malta Passport Number";
            Ensure               = "Present";
            Identity             = "b2b21198-48f9-4d13-b2a5-03969bff0fb8";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Malta Passport Number";
        }
        EXODataClassification "EXODataClassification-5d31b90c-7fe2-4a76-a14b-767b8fd19d6c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Romania Passport Number";
            Ensure               = "Present";
            Identity             = "5d31b90c-7fe2-4a76-a14b-767b8fd19d6c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Romania Passport Number";
        }
        EXODataClassification "EXODataClassification-a44669fe-0d48-453d-a9b1-2cc83f2cba77"
        {
            Credential           = $Credscredential;
            Description          = "Detecteert geformatteerde en niet-geformatteerde sociale verzekeringsnummers uit de VS.";
            Ensure               = "Present";
            Identity             = "a44669fe-0d48-453d-a9b1-2cc83f2cba77";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "U.S. Social Security Number (SSN)";
        }
        EXODataClassification "EXODataClassification-78e09124-f2c3-4656-b32a-c1a132cd2711"
        {
            Credential           = $Credscredential;
            Description          = "Detects Brazil CPF numbers";
            Ensure               = "Present";
            Identity             = "78e09124-f2c3-4656-b32a-c1a132cd2711";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Brazil CPF Number";
        }
        EXODataClassification "EXODataClassification-486de900-db70-41b3-a886-abdf25af119c"
        {
            Credential           = $Credscredential;
            Description          = "Detects Brazil National ID Card (RG)";
            Ensure               = "Present";
            Identity             = "486de900-db70-41b3-a886-abdf25af119c";
            IsDefault            = $True;
            Locale               = "en-US";
            Name                 = "Brazil National ID Card (RG)";
        }
        EXOEmailAddressPolicy "EXOEmailAddressPolicy-Default Policy"
        {
            Credential                        = $Credscredential;
            EnabledEmailAddressTemplates      = @("SMTP:@$OrganizationName");
            EnabledPrimarySMTPAddressTemplate = "@$OrganizationName";
            Ensure                            = "Present";
            ManagedByFilter                   = "";
            Name                              = "Default Policy";
            Priority                          = "Lowest";
        }
        EXOHostedConnectionFilterPolicy "EXOHostedConnectionFilterPolicy-Default"
        {
            AdminDisplayName     = "";
            Credential           = $Credscredential;
            EnableSafeList       = $False;
            Ensure               = "Present";
            Identity             = "Default";
            IPAllowList          = @();
            IPBlockList          = @();
            MakeDefault          = $False;
        }
        EXOHostedContentFilterPolicy "EXOHostedContentFilterPolicy-Default"
        {
            AddXHeaderValue                      = "";
            AdminDisplayName                     = "";
            BulkQuarantineTag                    = "DefaultFullAccessPolicy";
            BulkSpamAction                       = "MoveToJmf";
            BulkThreshold                        = 7;
            Credential                           = $Credscredential;
            DownloadLink                         = $False;
            EnableLanguageBlockList              = $False;
            EnableRegionBlockList                = $False;
            Ensure                               = "Present";
            HighConfidencePhishAction            = "Quarantine";
            HighConfidencePhishQuarantineTag     = "AdminOnlyAccessPolicy";
            HighConfidenceSpamAction             = "MoveToJmf";
            HighConfidenceSpamQuarantineTag      = "DefaultFullAccessPolicy";
            Identity                             = "Default";
            IncreaseScoreWithBizOrInfoUrls       = "Off";
            IncreaseScoreWithImageLinks          = "Off";
            IncreaseScoreWithNumericIps          = "Off";
            IncreaseScoreWithRedirectToOtherPort = "Off";
            InlineSafetyTipsEnabled              = $True;
            LanguageBlockList                    = @();
            MakeDefault                          = $True;
            MarkAsSpamBulkMail                   = "On";
            MarkAsSpamEmbedTagsInHtml            = "Off";
            MarkAsSpamEmptyMessages              = "Off";
            MarkAsSpamFormTagsInHtml             = "Off";
            MarkAsSpamFramesInHtml               = "Off";
            MarkAsSpamFromAddressAuthFail        = "Off";
            MarkAsSpamJavaScriptInHtml           = "Off";
            MarkAsSpamNdrBackscatter             = "Off";
            MarkAsSpamObjectTagsInHtml           = "Off";
            MarkAsSpamSensitiveWordList          = "Off";
            MarkAsSpamSpfRecordHardFail          = "Off";
            MarkAsSpamWebBugsInHtml              = "Off";
            ModifySubjectValue                   = "";
            PhishQuarantineTag                   = "DefaultFullAccessPolicy";
            PhishSpamAction                      = "MoveToJmf";
            PhishZapEnabled                      = $True;
            QuarantineRetentionPeriod            = 15;
            RedirectToRecipients                 = @();
            RegionBlockList                      = @();
            SpamAction                           = "MoveToJmf";
            SpamQuarantineTag                    = "DefaultFullAccessPolicy";
            SpamZapEnabled                       = $True;
            TestModeAction                       = "None";
            TestModeBccToRecipients              = @();
        }
        EXOHostedOutboundSpamFilterPolicy "EXOHostedOutboundSpamFilterPolicy-Default"
        {
            ActionWhenThresholdReached                = "BlockUserForToday";
            AdminDisplayName                          = "";
            AutoForwardingMode                        = "Automatic";
            BccSuspiciousOutboundAdditionalRecipients = @();
            BccSuspiciousOutboundMail                 = $False;
            Credential                                = $Credscredential;
            Ensure                                    = "Present";
            Identity                                  = "Default";
            NotifyOutboundSpam                        = $False;
            NotifyOutboundSpamRecipients              = @();
            RecipientLimitExternalPerHour             = 0;
            RecipientLimitInternalPerHour             = 0;
            RecipientLimitPerDay                      = 0;
        }
        EXOIRMConfiguration "EXOIRMConfiguration"
        {
            AutomaticServiceUpdateEnabled              = $True;
            AzureRMSLicensingEnabled                   = $True;
            Credential                                 = $Credscredential;
            DecryptAttachmentForEncryptOnly            = $False;
            EDiscoverySuperUserEnabled                 = $True;
            EnablePdfEncryption                        = $False;
            Ensure                                     = "Present";
            InternalLicensingEnabled                   = $True;
            IsSingleInstance                           = "Yes";
            JournalReportDecryptionEnabled             = $True;
            LicensingLocation                          = @("https://869e53b1-4fcb-4bf5-b2ef-7a44a75c2244.rms.eu.aadrm.com/_wmcs/licensing");
            RejectIfRecipientHasNoRights               = $False;
            SearchEnabled                              = $True;
            SimplifiedClientAccessDoNotForwardDisabled = $False;
            SimplifiedClientAccessEnabled              = $True;
            SimplifiedClientAccessEncryptOnlyDisabled  = $False;
            TransportDecryptionSetting                 = "Optional";
        }
        EXOMailboxPlan "EXOMailboxPlan-ExchangeOnline-0152e85b-c0e0-4687-b120-ab141729566d"
        {
            Credential               = $Credscredential;
            Identity                 = "ExchangeOnline-0152e85b-c0e0-4687-b120-ab141729566d";
            IssueWarningQuota        = "49 GB (52,613,349,376 bytes)";
            MaxReceiveSize           = "36 MB (37,748,736 bytes)";
            MaxSendSize              = "35 MB (36,700,160 bytes)";
            ProhibitSendQuota        = "49.5 GB (53,150,220,288 bytes)";
            ProhibitSendReceiveQuota = "50 GB (53,687,091,200 bytes)";
            RetainDeletedItemsFor    = "14.00:00:00";
        }
        EXOMailboxPlan "EXOMailboxPlan-ExchangeOnlineDeskless-be3b6f8d-7b00-467b-9738-098b6fb53038"
        {
            Credential               = $Credscredential;
            Identity                 = "ExchangeOnlineDeskless-be3b6f8d-7b00-467b-9738-098b6fb53038";
            IssueWarningQuota        = "1.96 GB (2,104,492,032 bytes)";
            MaxReceiveSize           = "36 MB (37,748,736 bytes)";
            MaxSendSize              = "35 MB (36,700,160 bytes)";
            ProhibitSendQuota        = "1.979 GB (2,125,463,552 bytes)";
            ProhibitSendReceiveQuota = "2 GB (2,147,483,648 bytes)";
            RetainDeletedItemsFor    = "14.00:00:00";
        }
        EXOMailboxPlan "EXOMailboxPlan-ExchangeOnlineEnterprise-bf243a25-ce7e-4eb7-bce1-dae8cc917e6c"
        {
            Credential               = $Credscredential;
            Identity                 = "ExchangeOnlineEnterprise-bf243a25-ce7e-4eb7-bce1-dae8cc917e6c";
            IssueWarningQuota        = "98 GB (105,226,698,752 bytes)";
            MaxReceiveSize           = "36 MB (37,748,736 bytes)";
            MaxSendSize              = "35 MB (36,700,160 bytes)";
            ProhibitSendQuota        = "99 GB (106,300,440,576 bytes)";
            ProhibitSendReceiveQuota = "100 GB (107,374,182,400 bytes)";
            RetainDeletedItemsFor    = "14.00:00:00";
        }
        EXOMailboxPlan "EXOMailboxPlan-ExchangeOnlineEssentials-21d91f8b-baf4-4c62-ad24-9e12121469e6"
        {
            Credential               = $Credscredential;
            Identity                 = "ExchangeOnlineEssentials-21d91f8b-baf4-4c62-ad24-9e12121469e6";
            IssueWarningQuota        = "14.7 GB (15,783,165,952 bytes)";
            MaxReceiveSize           = "36 MB (37,748,736 bytes)";
            MaxSendSize              = "35 MB (36,700,160 bytes)";
            ProhibitSendQuota        = "14.85 GB (15,944,646,656 bytes)";
            ProhibitSendReceiveQuota = "15 GB (16,106,127,360 bytes)";
            RetainDeletedItemsFor    = "14.00:00:00";
        }
        EXOMailTips "EXOMailTips"
        {
            Credential                            = $Credscredential;
            Ensure                                = "Present";
            MailTipsAllTipsEnabled                = $True;
            MailTipsExternalRecipientsTipsEnabled = $False;
            MailTipsGroupMetricsEnabled           = $True;
            MailTipsLargeAudienceThreshold        = 25;
            MailTipsMailboxSourcedTipsEnabled     = $True;
            Organization                          = "$OrganizationName";
        }
        EXOMalwareFilterPolicy "EXOMalwareFilterPolicy-Default"
        {
            Credential                             = $Credscredential;
            CustomNotifications                    = $False;
            EnableExternalSenderAdminNotifications = $False;
            EnableFileFilter                       = $False;
            EnableInternalSenderAdminNotifications = $False;
            Ensure                                 = "Present";
            FileTypeAction                         = "Reject";
            FileTypes                              = @("ace","apk","app","appx","ani","arj","bat","cab","cmd","com","deb","dex","dll","docm","elf","exe","hta","img","iso","jar","jnlp","kext","lha","lib","library","lnk","lzh","macho","msc","msi","msix","msp","mst","pif","ppa","ppam","reg","rev","scf","scr","sct","sys","uif","vb","vbe","vbs","vxd","wsc","wsf","wsh","xll","xz","z");
            Identity                               = "Default";
            MakeDefault                            = $True;
            QuarantineTag                          = "AdminOnlyAccessPolicy";
            ZapEnabled                             = $True;
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Audit Logs-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Audit Logs-Compliance Management";
            Role                 = "Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Compliance Admin-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Compliance Admin-Compliance Management";
            Role                 = "Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Data Loss Prevention-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Data Loss Prevention-Compliance Management";
            Role                 = "Data Loss Prevention";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Rights Management-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Rights Management-Compliance Management";
            Role                 = "Information Rights Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Journaling-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Journaling-Compliance Management";
            Role                 = "Journaling";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Message Tracking-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Message Tracking-Compliance Management";
            Role                 = "Message Tracking";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Retention Management-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Retention Management-Compliance Management";
            Role                 = "Retention Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Rules-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Rules-Compliance Management";
            Role                 = "Transport Rules";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Audit Logs-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Audit Logs-Compliance Management";
            Role                 = "View-Only Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Configuration-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Configuration-Compliance Management";
            Role                 = "View-Only Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-Compliance Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-Compliance Management";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Admin-Information Protection"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Admin-Information Protection";
            Role                 = "Information Protection Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Analyst-Information Protection"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Analyst-Information Protection";
            Role                 = "Information Protection Analyst";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Investigator-Information Protection"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Investigator-Information Protection";
            Role                 = "Information Protection Investigator";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Reader-Information Protection"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Reader-Information Protection";
            Role                 = "Information Protection Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Admin-Compliance Administrator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Admin-Compliance Administrator";
            Role                 = "Communication Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Administrator";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Admin-Compliance Administrator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Admin-Compliance Administrator";
            Role                 = "Insider Risk Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Administrator";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Admin-Security Administrator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Admin-Security Administrator";
            Role                 = "Security Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Administrator";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-SensitivityLabelAdministrator-Security Administrator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "SensitivityLabelAdministrator-Security Administrator";
            Role                 = "SensitivityLabelAdministrator";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Administrator";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Admin-Insider Risk Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Admin-Insider Risk Management";
            Role                 = "Insider Risk Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Investigation-Insider Risk Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Investigation-Insider Risk Management";
            Role                 = "Insider Risk Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Admin-Communication Compliance"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Admin-Communication Compliance";
            Role                 = "Communication Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Investigation-Communication Compliance"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Investigation-Communication Compliance";
            Role                 = "Communication Compliance Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Admin-Privacy Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Admin-Privacy Management";
            Role                 = "Privacy Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Investigation-Privacy Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Investigation-Privacy Management";
            Role                 = "Privacy Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Reader-Security Reader"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Reader-Security Reader";
            Role                 = "Security Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Reader";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Tenant AllowBlockList Manager-Security Operator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Tenant AllowBlockList Manager-Security Operator";
            Role                 = "Tenant AllowBlockList Manager";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Operator";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Admin-Insider Risk Management Admins"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Admin-Insider Risk Management Admins";
            Role                 = "Insider Risk Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Admins";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Investigation-Insider Risk Management In"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Investigation-Insider Risk Management In";
            Role                 = "Insider Risk Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Investigators";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Admin-Communication Compliance Administ"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Admin-Communication Compliance Administ";
            Role                 = "Communication Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Administrators";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Admin-Privacy Management Administrators"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Admin-Privacy Management Administrators";
            Role                 = "Privacy Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Administrators";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Investigation-Privacy Management Investigator"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Investigation-Privacy Management Investigator";
            Role                 = "Privacy Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Investigators";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Admin-Information Protection Admins"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Admin-Information Protection Admins";
            Role                 = "Information Protection Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Admins";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Analyst-Information Protection Analysts"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Analyst-Information Protection Analysts";
            Role                 = "Information Protection Analyst";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analysts";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Investigator-Information Protection Inves"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Investigator-Information Protection Inves";
            Role                 = "Information Protection Investigator";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Investigators";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Reader-Information Protection Readers"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Reader-Information Protection Readers";
            Role                 = "Information Protection Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Readers";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-ApplicationImpersonation-RIM-MailboxAdmins72bcab7b9b8c4518aad46b"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "ApplicationImpersonation-RIM-MailboxAdmins72bcab7b9b8c4518aad46b";
            Role                 = "ApplicationImpersonation";
            SecurityGroup        = "RIM-MailboxAdmins72bcab7b9b8c4518aad46b89eb806703";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Address Lists-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Address Lists-Organization Management-Delegating";
            Role                 = "Address Lists";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-ApplicationImpersonation-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "ApplicationImpersonation-Organization Management-Delegating";
            Role                 = "ApplicationImpersonation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-ArchiveApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "ArchiveApplication-Organization Management-Delegating";
            Role                 = "ArchiveApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Audit Logs-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Audit Logs-Organization Management-Delegating";
            Role                 = "Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Audit Logs-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Audit Logs-Organization Management";
            Role                 = "Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Admin-Organization Management";
            Role                 = "Communication Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Communication Compliance Investigation-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Communication Compliance Investigation-Organization Management";
            Role                 = "Communication Compliance Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Compliance Admin-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Compliance Admin-Organization Management-Delegating";
            Role                 = "Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Compliance Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Compliance Admin-Organization Management";
            Role                 = "Compliance Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Data Loss Prevention-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Data Loss Prevention-Organization Management-Delegating";
            Role                 = "Data Loss Prevention";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Data Loss Prevention-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Data Loss Prevention-Organization Management";
            Role                 = "Data Loss Prevention";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Distribution Groups-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Distribution Groups-Organization Management-Delegating";
            Role                 = "Distribution Groups";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Distribution Groups-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Distribution Groups-Organization Management";
            Role                 = "Distribution Groups";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-E-Mail Address Policies-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "E-Mail Address Policies-Organization Management-Delegating";
            Role                 = "E-Mail Address Policies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-E-Mail Address Policies-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "E-Mail Address Policies-Organization Management";
            Role                 = "E-Mail Address Policies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Federated Sharing-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Federated Sharing-Organization Management-Delegating";
            Role                 = "Federated Sharing";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Federated Sharing-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Federated Sharing-Organization Management";
            Role                 = "Federated Sharing";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Admin-Organization Management";
            Role                 = "Information Protection Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Analyst-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Analyst-Organization Management";
            Role                 = "Information Protection Analyst";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Investigator-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Investigator-Organization Management";
            Role                 = "Information Protection Investigator";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Protection Reader-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Protection Reader-Organization Management";
            Role                 = "Information Protection Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Rights Management-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Rights Management-Organization Management-Delegating";
            Role                 = "Information Rights Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Information Rights Management-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information Rights Management-Organization Management";
            Role                 = "Information Rights Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Admin-Organization Management";
            Role                 = "Insider Risk Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Insider Risk Management Investigation-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Insider Risk Management Investigation-Organization Management";
            Role                 = "Insider Risk Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Journaling-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Journaling-Organization Management-Delegating";
            Role                 = "Journaling";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Journaling-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Journaling-Organization Management";
            Role                 = "Journaling";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Legal Hold-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal Hold-Organization Management-Delegating";
            Role                 = "Legal Hold";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Legal Hold-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal Hold-Organization Management";
            Role                 = "Legal Hold";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-LegalHoldApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "LegalHoldApplication-Organization Management-Delegating";
            Role                 = "LegalHoldApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Enabled Public Folders-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Enabled Public Folders-Organization Management-Delegating";
            Role                 = "Mail Enabled Public Folders";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Enabled Public Folders-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Enabled Public Folders-Organization Management";
            Role                 = "Mail Enabled Public Folders";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipient Creation-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipient Creation-Organization Management-Delegating";
            Role                 = "Mail Recipient Creation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipient Creation-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipient Creation-Organization Management";
            Role                 = "Mail Recipient Creation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipients-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipients-Organization Management-Delegating";
            Role                 = "Mail Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipients-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipients-Organization Management";
            Role                 = "Mail Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Tips-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Tips-Organization Management-Delegating";
            Role                 = "Mail Tips";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Tips-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Tips-Organization Management";
            Role                 = "Mail Tips";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mailbox Import Export-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mailbox Import Export-Organization Management-Delegating";
            Role                 = "Mailbox Import Export";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mailbox Search-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mailbox Search-Organization Management-Delegating";
            Role                 = "Mailbox Search";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MailboxSearchApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MailboxSearchApplication-Organization Management-Delegating";
            Role                 = "MailboxSearchApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MeetingGraphApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MeetingGraphApplication-Organization Management-Delegating";
            Role                 = "MeetingGraphApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Message Tracking-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Message Tracking-Organization Management-Delegating";
            Role                 = "Message Tracking";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Message Tracking-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Message Tracking-Organization Management";
            Role                 = "Message Tracking";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Migration-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Migration-Organization Management-Delegating";
            Role                 = "Migration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Migration-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Migration-Organization Management";
            Role                 = "Migration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Move Mailboxes-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Move Mailboxes-Organization Management-Delegating";
            Role                 = "Move Mailboxes";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Move Mailboxes-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Move Mailboxes-Organization Management";
            Role                 = "Move Mailboxes";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-OfficeExtensionApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "OfficeExtensionApplication-Organization Management-Delegating";
            Role                 = "OfficeExtensionApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Org Custom Apps-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Org Custom Apps-Organization Management-Delegating";
            Role                 = "Org Custom Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Org Custom Apps-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Org Custom Apps-Organization Management";
            Role                 = "Org Custom Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Org Marketplace Apps-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Org Marketplace Apps-Organization Management-Delegating";
            Role                 = "Org Marketplace Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Org Marketplace Apps-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Org Marketplace Apps-Organization Management";
            Role                 = "Org Marketplace Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Client Access-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Client Access-Organization Management-Delegating";
            Role                 = "Organization Client Access";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Client Access-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Client Access-Organization Management";
            Role                 = "Organization Client Access";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Configuration-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Configuration-Organization Management-Delegating";
            Role                 = "Organization Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Configuration-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Configuration-Organization Management";
            Role                 = "Organization Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Transport Settings-Organization Management-Delegati"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Transport Settings-Organization Management-Delegati";
            Role                 = "Organization Transport Settings";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Organization Transport Settings-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Organization Transport Settings-Organization Management";
            Role                 = "Organization Transport Settings";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Admin-Organization Management";
            Role                 = "Privacy Management Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Privacy Management Investigation-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Privacy Management Investigation-Organization Management";
            Role                 = "Privacy Management Investigation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Public Folders-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Public Folders-Organization Management-Delegating";
            Role                 = "Public Folders";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Public Folders-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Public Folders-Organization Management";
            Role                 = "Public Folders";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Recipient Policies-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Recipient Policies-Organization Management-Delegating";
            Role                 = "Recipient Policies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Recipient Policies-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Recipient Policies-Organization Management";
            Role                 = "Recipient Policies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Remote and Accepted Domains-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Remote and Accepted Domains-Organization Management-Delegating";
            Role                 = "Remote and Accepted Domains";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Remote and Accepted Domains-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Remote and Accepted Domains-Organization Management";
            Role                 = "Remote and Accepted Domains";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Reset Password-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Reset Password-Organization Management-Delegating";
            Role                 = "Reset Password";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Reset Password-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Reset Password-Organization Management";
            Role                 = "Reset Password";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Retention Management-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Retention Management-Organization Management-Delegating";
            Role                 = "Retention Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Retention Management-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Retention Management-Organization Management";
            Role                 = "Retention Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Role Management-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Role Management-Organization Management-Delegating";
            Role                 = "Role Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Role Management-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Role Management-Organization Management";
            Role                 = "Role Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Admin-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Admin-Organization Management-Delegating";
            Role                 = "Security Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Admin-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Admin-Organization Management";
            Role                 = "Security Admin";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Group Creation and Membership-Organization Management-D"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Group Creation and Membership-Organization Management-D";
            Role                 = "Security Group Creation and Membership";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Group Creation and Membership-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Group Creation and Membership-Organization Management";
            Role                 = "Security Group Creation and Membership";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Reader-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Reader-Organization Management-Delegating";
            Role                 = "Security Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Security Reader-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Security Reader-Organization Management";
            Role                 = "Security Reader";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-SendMailApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "SendMailApplication-Organization Management-Delegating";
            Role                 = "SendMailApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-SensitivityLabelAdministrator-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "SensitivityLabelAdministrator-Organization Management-Delegating";
            Role                 = "SensitivityLabelAdministrator";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-TeamMailboxLifecycleApplication-Organization Management-Delegati"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "TeamMailboxLifecycleApplication-Organization Management-Delegati";
            Role                 = "TeamMailboxLifecycleApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Tenant AllowBlockList Manager-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Tenant AllowBlockList Manager-Organization Management-Delegating";
            Role                 = "Tenant AllowBlockList Manager";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-TenantPlacesManagement-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "TenantPlacesManagement-Organization Management-Delegating";
            Role                 = "TenantPlacesManagement";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-TenantPlacesManagement-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "TenantPlacesManagement-Organization Management";
            Role                 = "TenantPlacesManagement";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Hygiene-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Hygiene-Organization Management-Delegating";
            Role                 = "Transport Hygiene";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Hygiene-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Hygiene-Organization Management";
            Role                 = "Transport Hygiene";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Rules-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Rules-Organization Management-Delegating";
            Role                 = "Transport Rules";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Rules-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Rules-Organization Management";
            Role                 = "Transport Rules";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-UserApplication-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "UserApplication-Organization Management-Delegating";
            Role                 = "UserApplication";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-User Options-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "User Options-Organization Management-Delegating";
            Role                 = "User Options";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-User Options-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "User Options-Organization Management";
            Role                 = "User Options";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Audit Logs-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Audit Logs-Organization Management-Delegating";
            Role                 = "View-Only Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Audit Logs-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Audit Logs-Organization Management";
            Role                 = "View-Only Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Configuration-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Configuration-Organization Management-Delegating";
            Role                 = "View-Only Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Configuration-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Configuration-Organization Management";
            Role                 = "View-Only Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-Organization Management-Delegating";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-Organization Management";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Mail.Read-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Mail.Read-Organization Management-Delegating";
            Role                 = "Application Mail.Read";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Mail.ReadBasic-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Mail.ReadBasic-Organization Management-Delegating";
            Role                 = "Application Mail.ReadBasic";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Mail.ReadWrite-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Mail.ReadWrite-Organization Management-Delegating";
            Role                 = "Application Mail.ReadWrite";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Mail.Send-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Mail.Send-Organization Management-Delegating";
            Role                 = "Application Mail.Send";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application MailboxSettings.Read-Organization Management-Delegat"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application MailboxSettings.Read-Organization Management-Delegat";
            Role                 = "Application MailboxSettings.Read";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application MailboxSettings.ReadWrite-Organization Management-De"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application MailboxSettings.ReadWrite-Organization Management-De";
            Role                 = "Application MailboxSettings.ReadWrite";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Calendars.Read-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Calendars.Read-Organization Management-Delegating";
            Role                 = "Application Calendars.Read";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Calendars.ReadWrite-Organization Management-Delegati"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Calendars.ReadWrite-Organization Management-Delegati";
            Role                 = "Application Calendars.ReadWrite";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Contacts.Read-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Contacts.Read-Organization Management-Delegating";
            Role                 = "Application Contacts.Read";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Contacts.ReadWrite-Organization Management-Delegatin"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Contacts.ReadWrite-Organization Management-Delegatin";
            Role                 = "Application Contacts.ReadWrite";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Mail Full Access-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Mail Full Access-Organization Management-Delegating";
            Role                 = "Application Mail Full Access";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application Exchange Full Access-Organization Management-Delegat"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application Exchange Full Access-Organization Management-Delegat";
            Role                 = "Application Exchange Full Access";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Application EWS.AccessAsApp-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Application EWS.AccessAsApp-Organization Management-Delegating";
            Role                 = "Application EWS.AccessAsApp";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My Custom Apps-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My Custom Apps-Organization Management-Delegating";
            Role                 = "My Custom Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My Marketplace Apps-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My Marketplace Apps-Organization Management-Delegating";
            Role                 = "My Marketplace Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My ReadWriteMailbox Apps-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My ReadWriteMailbox Apps-Organization Management-Delegating";
            Role                 = "My ReadWriteMailbox Apps";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyBaseOptions-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyBaseOptions-Organization Management-Delegating";
            Role                 = "MyBaseOptions";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyContactInformation-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyContactInformation-Organization Management-Delegating";
            Role                 = "MyContactInformation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyDistributionGroupMembership-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyDistributionGroupMembership-Organization Management-Delegating";
            Role                 = "MyDistributionGroupMembership";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyDistributionGroups-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyDistributionGroups-Organization Management-Delegating";
            Role                 = "MyDistributionGroups";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyMailSubscriptions-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyMailSubscriptions-Organization Management-Delegating";
            Role                 = "MyMailSubscriptions";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyMailboxDelegation-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyMailboxDelegation-Organization Management-Delegating";
            Role                 = "MyMailboxDelegation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyProfileInformation-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyProfileInformation-Organization Management-Delegating";
            Role                 = "MyProfileInformation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyRetentionPolicies-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyRetentionPolicies-Organization Management-Delegating";
            Role                 = "MyRetentionPolicies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyTextMessaging-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyTextMessaging-Organization Management-Delegating";
            Role                 = "MyTextMessaging";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyVoiceMail-Organization Management-Delegating"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyVoiceMail-Organization Management-Delegating";
            Role                 = "MyVoiceMail";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My Custom Apps-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My Custom Apps-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "My Custom Apps";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My Marketplace Apps-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My Marketplace Apps-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "My Marketplace Apps";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-My ReadWriteMailbox Apps-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "My ReadWriteMailbox Apps-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "My ReadWriteMailbox Apps";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyBaseOptions-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyBaseOptions-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyBaseOptions";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyContactInformation-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyContactInformation-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyContactInformation";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyMailSubscriptions-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyMailSubscriptions-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyMailSubscriptions";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyProfileInformation-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyProfileInformation-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyProfileInformation";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyRetentionPolicies-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyRetentionPolicies-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyRetentionPolicies";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyTextMessaging-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyTextMessaging-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyTextMessaging";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyVoiceMail-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyVoiceMail-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyVoiceMail";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyDistributionGroupMembership-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyDistributionGroupMembership-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyDistributionGroupMembership";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-MyDistributionGroups-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "MyDistributionGroups-Default Role Assignment Policy";
            Policy               = "Default Role Assignment Policy";
            Role                 = "MyDistributionGroups";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Distribution Groups-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Distribution Groups-Recipient Management";
            Role                 = "Distribution Groups";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipient Creation-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipient Creation-Recipient Management";
            Role                 = "Mail Recipient Creation";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mail Recipients-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mail Recipients-Recipient Management";
            Role                 = "Mail Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Message Tracking-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Message Tracking-Recipient Management";
            Role                 = "Message Tracking";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Migration-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Migration-Recipient Management";
            Role                 = "Migration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Move Mailboxes-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Move Mailboxes-Recipient Management";
            Role                 = "Move Mailboxes";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Recipient Policies-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Recipient Policies-Recipient Management";
            Role                 = "Recipient Policies";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Reset Password-Recipient Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Reset Password-Recipient Management";
            Role                 = "Reset Password";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Recipient Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Audit Logs-Records Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Audit Logs-Records Management";
            Role                 = "Audit Logs";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Records Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Journaling-Records Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Journaling-Records Management";
            Role                 = "Journaling";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Records Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Message Tracking-Records Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Message Tracking-Records Management";
            Role                 = "Message Tracking";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Records Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Retention Management-Records Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Retention Management-Records Management";
            Role                 = "Retention Management";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Records Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Rules-Records Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Rules-Records Management";
            Role                 = "Transport Rules";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Records Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Reset Password-Help Desk"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Reset Password-Help Desk";
            Role                 = "Reset Password";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Help Desk";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-User Options-Help Desk"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "User Options-Help Desk";
            Role                 = "User Options";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Help Desk";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-Help Desk"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-Help Desk";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Help Desk";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Transport Hygiene-Hygiene Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Transport Hygiene-Hygiene Management";
            Role                 = "Transport Hygiene";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Hygiene Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Configuration-Hygiene Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Configuration-Hygiene Management";
            Role                 = "View-Only Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Hygiene Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-Hygiene Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-Hygiene Management";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Hygiene Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Configuration-View-Only Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Configuration-View-Only Organization Management";
            Role                 = "View-Only Configuration";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-View-Only Recipients-View-Only Organization Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "View-Only Recipients-View-Only Organization Management";
            Role                 = "View-Only Recipients";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Organization Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Legal Hold-Discovery Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal Hold-Discovery Management";
            Role                 = "Legal Hold";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Discovery Management";
        }
        EXOManagementRoleAssignment "EXOManagementRoleAssignment-Mailbox Search-Discovery Management"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Mailbox Search-Discovery Management";
            Role                 = "Mailbox Search";
            SecurityGroup        = "EURP192A004.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/$OrganizationName/Discovery Management";
        }
        EXOMobileDeviceMailboxPolicy "EXOMobileDeviceMailboxPolicy-Default"
        {
            AllowApplePushNotifications              = $True;
            AllowBluetooth                           = "Allow";
            AllowBrowser                             = $True;
            AllowCamera                              = $True;
            AllowConsumerEmail                       = $True;
            AllowDesktopSync                         = $True;
            AllowExternalDeviceManagement            = $False;
            AllowGooglePushNotifications             = $True;
            AllowHTMLEmail                           = $True;
            AllowInternetSharing                     = $True;
            AllowIrDA                                = $True;
            AllowMicrosoftPushNotifications          = $True;
            AllowMobileOTAUpdate                     = $True;
            AllowNonProvisionableDevices             = $True;
            AllowPOPIMAPEmail                        = $True;
            AllowRemoteDesktop                       = $True;
            AllowSimplePassword                      = $True;
            AllowSMIMEEncryptionAlgorithmNegotiation = "AllowAnyAlgorithmNegotiation";
            AllowSMIMESoftCerts                      = $True;
            AllowStorageCard                         = $True;
            AllowTextMessaging                       = $True;
            AllowUnsignedApplications                = $True;
            AllowUnsignedInstallationPackages        = $True;
            AllowWiFi                                = $True;
            AlphanumericPasswordRequired             = $False;
            ApprovedApplicationList                  = @();
            AttachmentsEnabled                       = $True;
            Credential                               = $Credscredential;
            DeviceEncryptionEnabled                  = $False;
            DevicePolicyRefreshInterval              = "Unlimited";
            Ensure                                   = "Present";
            IrmEnabled                               = $True;
            IsDefault                                = $True;
            MaxAttachmentSize                        = "Unlimited";
            MaxCalendarAgeFilter                     = "All";
            MaxEmailAgeFilter                        = "All";
            MaxEmailBodyTruncationSize               = "Unlimited";
            MaxEmailHTMLBodyTruncationSize           = "Unlimited";
            MaxInactivityTimeLock                    = "Unlimited";
            MaxPasswordFailedAttempts                = "Unlimited";
            MinPasswordComplexCharacters             = 1;
            Name                                     = "Default";
            PasswordEnabled                          = $False;
            PasswordExpiration                       = "Unlimited";
            PasswordHistory                          = 0;
            PasswordRecoveryEnabled                  = $False;
            RequireDeviceEncryption                  = $False;
            RequireEncryptedSMIMEMessages            = $False;
            RequireEncryptionSMIMEAlgorithm          = "TripleDES";
            RequireManualSyncWhenRoaming             = $False;
            RequireSignedSMIMEAlgorithm              = "SHA1";
            RequireSignedSMIMEMessages               = $False;
            RequireStorageCardEncryption             = $False;
            UnapprovedInROMApplicationList           = @();
            UNCAccessEnabled                         = $True;
            WSSAccessEnabled                         = $True;
        }
        EXOOMEConfiguration "EXOOMEConfiguration-OME Configuration"
        {
            BackgroundColor      = "";
            Credential           = $Credscredential;
            DisclaimerText       = "";
            EmailText            = "";
            Ensure               = "Present";
            Identity             = "OME Configuration";
            IntroductionText     = "";
            OTPEnabled           = $True;
            PortalText           = "";
            PrivacyStatementUrl  = "";
            ReadButtonText       = "";
            SocialIdSignIn       = $True;
        }
        EXOOrganizationConfig "EXOOrganizationConfig"
        {
            ActivityBasedAuthenticationTimeoutEnabled                 = $True;
            ActivityBasedAuthenticationTimeoutInterval                = "06:00:00";
            ActivityBasedAuthenticationTimeoutWithSingleSignOnEnabled = $True;
            AppsForOfficeEnabled                                      = $True;
            AsyncSendEnabled                                          = $True;
            AuditDisabled                                             = $False;
            AutodiscoverPartialDirSync                                = $False;
            AutoExpandingArchive                                      = $False;
            BlockMoveMessagesForGroupFolders                          = $False;
            BookingsAddressEntryRestricted                            = $False;
            BookingsAuthEnabled                                       = $False;
            BookingsBlockedWordsEnabled                               = $False;
            BookingsCreationOfCustomQuestionsRestricted               = $False;
            BookingsEnabled                                           = $True;
            BookingsExposureOfStaffDetailsRestricted                  = $False;
            BookingsMembershipApprovalRequired                        = $False;
            BookingsNamingPolicyEnabled                               = $False;
            BookingsNamingPolicyPrefix                                = "";
            BookingsNamingPolicyPrefixEnabled                         = $False;
            BookingsNamingPolicySuffix                                = "";
            BookingsNamingPolicySuffixEnabled                         = $False;
            BookingsNotesEntryRestricted                              = $False;
            BookingsPaymentsEnabled                                   = $False;
            BookingsPhoneNumberEntryRestricted                        = $False;
            BookingsSearchEngineIndexDisabled                         = $False;
            BookingsSmsMicrosoftEnabled                               = $True;
            BookingsSocialSharingRestricted                           = $False;
            ByteEncoderTypeFor7BitCharsets                            = 0;
            ComplianceMLBgdCrawlEnabled                               = $False;
            ConnectorsActionableMessagesEnabled                       = $True;
            ConnectorsEnabled                                         = $True;
            ConnectorsEnabledForOutlook                               = $True;
            ConnectorsEnabledForSharepoint                            = $True;
            ConnectorsEnabledForTeams                                 = $True;
            ConnectorsEnabledForYammer                                = $True;
            Credential                                                = $Credscredential;
            CustomerLockboxEnabled                                    = $False;
            DefaultGroupAccessType                                    = "Private";
            DefaultMinutesToReduceLongEventsBy                        = 10;
            DefaultMinutesToReduceShortEventsBy                       = 5;
            DefaultPublicFolderDeletedItemRetention                   = "30.00:00:00";
            DefaultPublicFolderIssueWarningQuota                      = "1.7 GB (1,825,361,920 bytes)";
            DefaultPublicFolderMaxItemSize                            = "Unlimited";
            DefaultPublicFolderMovedItemRetention                     = "7.00:00:00";
            DefaultPublicFolderProhibitPostQuota                      = "2 GB (2,147,483,648 bytes)";
            DirectReportsGroupAutoCreationEnabled                     = $False;
            DisablePlusAddressInRecipients                            = $False;
            DistributionGroupNameBlockedWordsList                     = @();
            DistributionGroupNamingPolicy                             = "";
            ElcProcessingDisabled                                     = $False;
            EnableOutlookEvents                                       = $False;
            EndUserDLUpgradeFlowsDisabled                             = $False;
            ExchangeNotificationEnabled                               = $True;
            ExchangeNotificationRecipients                            = @();
            FindTimeAttendeeAuthenticationEnabled                     = $False;
            FindTimeAutoScheduleDisabled                              = $False;
            FindTimeLockPollForAttendeesEnabled                       = $False;
            FindTimeOnlineMeetingOptionDisabled                       = $False;
            IPListBlocked                                             = @();
            IsGroupFoldersAndRulesEnabled                             = $False;
            IsGroupMemberAllowedToEditContent                         = $False;
            IsSingleInstance                                          = "Yes";
            LeanPopoutEnabled                                         = $False;
            LinkPreviewEnabled                                        = $True;
            MailTipsAllTipsEnabled                                    = $True;
            MailTipsExternalRecipientsTipsEnabled                     = $False;
            MailTipsGroupMetricsEnabled                               = $True;
            MailTipsLargeAudienceThreshold                            = 25;
            MailTipsMailboxSourcedTipsEnabled                         = $True;
            MaskClientIpInReceivedHeadersEnabled                      = $True;
            MatchSenderOrganizerProperties                            = $False;
            MessageHighlightsEnabled                                  = $True;
            MessageRemindersEnabled                                   = $True;
            MobileAppEducationEnabled                                 = $True;
            OAuth2ClientProfileEnabled                                = $True;
            OutlookGifPickerDisabled                                  = $False;
            OutlookMobileGCCRestrictionsEnabled                       = $False;
            OutlookPayEnabled                                         = $True;
            OutlookTextPredictionDisabled                             = $False;
            PublicComputersDetectionEnabled                           = $False;
            PublicFoldersEnabled                                      = "Local";
            PublicFolderShowClientControl                             = $False;
            ReadTrackingEnabled                                       = $False;
            RemotePublicFolderMailboxes                               = @();
            SendFromAliasEnabled                                      = $False;
            SharedDomainEmailAddressFlowEnabled                       = $True;
            ShortenEventScopeDefault                                  = "None";
            SmtpActionableMessagesEnabled                             = $True;
            VisibleMeetingUpdateProperties                            = "Location,AllProperties:15";
            WebPushNotificationsDisabled                              = $False;
            WebSuggestedRepliesDisabled                               = $False;
            WorkspaceTenantEnabled                                    = $True;
        }
        EXOOwaMailboxPolicy "EXOOwaMailboxPolicy-OwaMailboxPolicy-Default"
        {
            ActionForUnknownFileAndMIMETypes                     = "Allow";
            ActiveSyncIntegrationEnabled                         = $True;
            AdditionalStorageProvidersAvailable                  = $True;
            AllAddressListsEnabled                               = $True;
            AllowCopyContactsToDeviceAddressBook                 = $True;
            AllowedFileTypes                                     = @(".rpmsg",".xlsx",".xlsm",".xlsb",".vstx",".vstm",".vssx",".vssm",".vsdx",".vsdm",".tiff",".pptx",".pptm",".ppsx",".ppsm",".docx",".docm",".zip",".xls",".wmv",".wma",".wav",".vtx",".vsx",".vst",".vss",".vsd",".vdx",".txt",".tif",".rtf",".pub",".ppt",".png",".pdf",".one",".mp3",".jpg",".gif",".doc",".csv",".bmp",".avi");
            AllowedMimeTypes                                     = @("image/jpeg","image/png","image/gif","image/bmp");
            BlockedFileTypes                                     = @(".settingcontent-ms",".printerexport",".appcontent-ms",".application",".appref-ms",".vsmacros",".website",".msh2xml",".msh1xml",".diagcab",".webpnp",".ps2xml",".ps1xml",".mshxml",".gadget",".theme",".psdm1",".mhtml",".cdxml",".xbap",".vhdx",".pyzw",".pssc",".psd1",".psc2",".psc1",".msh2",".msh1",".jnlp",".aspx",".appx",".xnk",".xll",".wsh",".wsf",".wsc",".wsb",".vsw",".vhd",".vbs",".vbp",".vbe",".url",".udl",".tmp",".shs",".shb",".sct",".scr",".scf",".reg",".pyz",".pyw",".pyo",".pyc",".pst",".ps2",".ps1",".prg",".prf",".plg",".pif",".pcd",".osd",".ops",".msu",".mst",".msp",".msi",".msh",".msc",".mht",".mdz",".mdw",".mdt",".mde",".mdb",".mda",".mcf",".maw",".mav",".mau",".mat",".mas",".mar",".maq",".mam",".mag",".maf",".mad",".lnk",".ksh",".jse",".jar",".its",".isp",".iso",".ins",".inf",".img",".htc",".hta",".hpj",".hlp",".grp",".fxp",".exe",".der",".csh",".crt",".cpl",".com",".cnt",".cmd",".chm",".cer",".cab",".bgi",".bat",".bas",".asx",".asp",".app",".apk",".adp",".ade",".ws",".vb",".py",".pl",".js");
            BlockedMimeTypes                                     = @("application/x-javascript","application/javascript","application/msaccess","x-internet-signup","text/javascript","application/prg","application/hta","text/scriplet");
            BookingsMailboxCreationEnabled                       = $True;
            ClassicAttachmentsEnabled                            = $True;
            ConditionalAccessPolicy                              = "Off";
            Credential                                           = $Credscredential;
            DefaultTheme                                         = "";
            DirectFileAccessOnPrivateComputersEnabled            = $True;
            DirectFileAccessOnPublicComputersEnabled             = $True;
            DisplayPhotosEnabled                                 = $True;
            Ensure                                               = "Present";
            ExplicitLogonEnabled                                 = $True;
            ExternalImageProxyEnabled                            = $True;
            FeedbackEnabled                                      = $True;
            ForceSaveAttachmentFilteringEnabled                  = $False;
            ForceSaveFileTypes                                   = @(".svgz",".html",".xml",".swf",".svg",".spl",".htm",".dir",".dcr");
            ForceSaveMimeTypes                                   = @("Application/x-shockwave-flash","Application/octet-stream","Application/futuresplash","Application/x-director","application/xml","image/svg+xml","text/html","text/xml");
            ForceWacViewingFirstOnPrivateComputers               = $False;
            ForceWacViewingFirstOnPublicComputers                = $False;
            FreCardsEnabled                                      = $True;
            GlobalAddressListEnabled                             = $True;
            GroupCreationEnabled                                 = $True;
            InstantMessagingEnabled                              = $True;
            InstantMessagingType                                 = "Ocs";
            InterestingCalendarsEnabled                          = $True;
            IRMEnabled                                           = $True;
            IsDefault                                            = $True;
            JournalEnabled                                       = $True;
            LocalEventsEnabled                                   = $False;
            LogonAndErrorLanguage                                = 0;
            MessagePreviewsDisabled                              = $False;
            Name                                                 = "OwaMailboxPolicy-Default";
            NotesEnabled                                         = $True;
            NpsSurveysEnabled                                    = $True;
            OnSendAddinsEnabled                                  = $False;
            OrganizationEnabled                                  = $True;
            OutboundCharset                                      = "AutoDetect";
            OutlookBetaToggleEnabled                             = $True;
            OWALightEnabled                                      = $True;
            PersonalAccountCalendarsEnabled                      = $True;
            PhoneticSupportEnabled                               = $False;
            PlacesEnabled                                        = $True;
            PremiumClientEnabled                                 = $True;
            PrintWithoutDownloadEnabled                          = $True;
            ProjectMocaEnabled                                   = $False;
            PublicFoldersEnabled                                 = $True;
            RecoverDeletedItemsEnabled                           = $True;
            ReferenceAttachmentsEnabled                          = $True;
            RemindersAndNotificationsEnabled                     = $True;
            ReportJunkEmailEnabled                               = $True;
            RulesEnabled                                         = $True;
            SatisfactionEnabled                                  = $True;
            SaveAttachmentsToCloudEnabled                        = $True;
            SearchFoldersEnabled                                 = $True;
            SetPhotoEnabled                                      = $True;
            SetPhotoURL                                          = "";
            ShowOnlineArchiveEnabled                             = $True;
            SignaturesEnabled                                    = $True;
            SkipCreateUnifiedGroupCustomSharepointClassification = $True;
            TeamSnapCalendarsEnabled                             = $True;
            TextMessagingEnabled                                 = $True;
            ThemeSelectionEnabled                                = $True;
            UMIntegrationEnabled                                 = $True;
            UseGB18030                                           = $False;
            UseISO885915                                         = $False;
            UserVoiceEnabled                                     = $True;
            WacEditingEnabled                                    = $True;
            WacExternalServicesEnabled                           = $True;
            WacOMEXEnabled                                       = $False;
            WacViewingOnPrivateComputersEnabled                  = $True;
            WacViewingOnPublicComputersEnabled                   = $True;
            WeatherEnabled                                       = $True;
            WebPartsFrameOptionsType                             = "SameOrigin";
        }
        EXOPerimeterConfiguration "EXOPerimeterConfiguration"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            GatewayIPAddresses   = @();
            IsSingleInstance     = "Yes";
        }
        EXOQuarantinePolicy "EXOQuarantinePolicy-EsdecSolarGroupTest.onmicrosoft.com\DefaultFullAccessPolicy"
        {
            Credential                        = $Credscredential;
            EndUserQuarantinePermissionsValue = 87;
            Ensure                            = "Present";
            ESNEnabled                        = $False;
            Identity                          = "$OrganizationName\DefaultFullAccessPolicy";
        }
        EXOQuarantinePolicy "EXOQuarantinePolicy-EsdecSolarGroupTest.onmicrosoft.com\AdminOnlyAccessPolicy"
        {
            Credential                        = $Credscredential;
            EndUserQuarantinePermissionsValue = 0;
            Ensure                            = "Present";
            ESNEnabled                        = $False;
            Identity                          = "$OrganizationName\AdminOnlyAccessPolicy";
        }
        EXOQuarantinePolicy "EXOQuarantinePolicy-EsdecSolarGroupTest.onmicrosoft.com\DefaultFullAccessWithNotificationPolicy"
        {
            Credential                        = $Credscredential;
            EndUserQuarantinePermissionsValue = 87;
            Ensure                            = "Present";
            ESNEnabled                        = $True;
            Identity                          = "$OrganizationName\DefaultFullAccessWithNotificationPolicy";
        }
        EXOQuarantinePolicy "EXOQuarantinePolicy-EsdecSolarGroupTest.onmicrosoft.com\DefaultGlobalPolicy"
        {
            Credential                             = $Credscredential;
            EndUserSpamNotificationFrequency       = "1.00:00:00";
            EndUserSpamNotificationFrequencyInDays = 3;
            Ensure                                 = "Present";
            Identity                               = "$OrganizationName\DefaultGlobalPolicy";
            OrganizationBrandingEnabled            = $False;
            QuarantinePolicyType                   = "GlobalQuarantineTag";
        }
        EXORemoteDomain "EXORemoteDomain-Default"
        {
            AllowedOOFType                       = "External";
            AutoForwardEnabled                   = $True;
            AutoReplyEnabled                     = $True;
            ByteEncoderTypeFor7BitCharsets       = "Undefined";
            CharacterSet                         = "iso-8859-1";
            ContentType                          = "MimeHtmlText";
            Credential                           = $Credscredential;
            DeliveryReportEnabled                = $True;
            DisplaySenderName                    = $True;
            DomainName                           = "*";
            Ensure                               = "Present";
            Identity                             = "Default";
            IsInternal                           = $False;
            LineWrapSize                         = "Unlimited";
            MeetingForwardNotificationEnabled    = $False;
            Name                                 = "Default";
            NDREnabled                           = $True;
            NonMimeCharacterSet                  = "iso-8859-1";
            PreferredInternetCodePageForShiftJis = "Undefined";
            TargetDeliveryDomain                 = $False;
            TrustedMailInboundEnabled            = $False;
            TrustedMailOutboundEnabled           = $False;
            UseSimpleDisplayName                 = $False;
        }
        EXOResourceConfiguration "EXOResourceConfiguration"
        {
            Credential             = $Credscredential;
            Ensure                 = "Present";
            IsSingleInstance       = "Yes";
            ResourcePropertySchema = @();
        }
        EXORoleAssignmentPolicy "EXORoleAssignmentPolicy-Default Role Assignment Policy"
        {
            Credential           = $Credscredential;
            Description          = "This policy grants end users the permission to set their options in Outlook on the web and perform other self-administration tasks.";
            Ensure               = "Present";
            IsDefault            = $True;
            Name                 = "Default Role Assignment Policy";
            Roles                = @("My Custom Apps","My Marketplace Apps","My ReadWriteMailbox Apps","MyBaseOptions","MyContactInformation","MyMailSubscriptions","MyProfileInformation","MyRetentionPolicies","MyTextMessaging","MyVoiceMail","MyDistributionGroupMembership","MyDistributionGroups");
        }
        EXORoleGroup "EXORoleGroup-AttackSimAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Create and manage all aspects of attack simulation campaigns.";
            Ensure               = "Present";
            Name                 = "AttackSimAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Attack Simulator Admin");
        }
        EXORoleGroup "EXORoleGroup-AttackSimPayloadAuthors"
        {
            Credential           = $Credscredential;
            Description          = "Create and manage attack payloads that can be deployed by attack simulator administrator.";
            Ensure               = "Present";
            Name                 = "AttackSimPayloadAuthors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Attack Simulator Payload Author");
        }
        EXORoleGroup "EXORoleGroup-OrganizationManagement"
        {
            Credential           = $Credscredential;
            Description          = "Members of this management role group have permissions to manage Exchange objects and their properties in the Exchange organization. Members can also delegate role groups and management roles in the organization. This role group shouldn't be deleted.";
            Ensure               = "Present";
            Name                 = "OrganizationManagement";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Administration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Hold","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Configuration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Quarantine","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RecordManagement","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Retention Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Role Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Search And Purge","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Service Assurance View","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Contributor","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Recipients","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Record Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Retention Management");
        }
        EXORoleGroup "EXORoleGroup-SecurityAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "";
            Ensure               = "Present";
            Name                 = "SecurityAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Administration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Quarantine","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Contributor","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts");
        }
        EXORoleGroup "EXORoleGroup-AuditManager"
        {
            Credential           = $Credscredential;
            Description          = "Manage Audit log settings and Search, View, and Export Audit logs. ";
            Ensure               = "Present";
            Name                 = "AuditManager";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs");
        }
        EXORoleGroup "EXORoleGroup-BillingAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "Can configure Billing features.";
            Ensure               = "Present";
            Name                 = "BillingAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Billing Admin");
        }
        EXORoleGroup "EXORoleGroup-eDiscoveryManager"
        {
            Credential           = $Credscredential;
            Description          = "Perform searches and place holds on mailboxes, SharePoint Online sites, and OneDrive for Business locations.";
            Ensure               = "Present";
            Name                 = "eDiscoveryManager";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Custodian","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Export","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Hold","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Review Set Tags","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Preview","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Review","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RMS Decrypt","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager");
        }
        EXORoleGroup "EXORoleGroup-ComplianceAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "Manage settings for device management, data loss prevention, reports, and preservation.";
            Ensure               = "Present";
            Name                 = "ComplianceAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Administration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Credential Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Credential Writer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Feedback Provider","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Feedback Reviewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Investigation Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Disposition Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Hold","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analyst","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Configuration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RecordManagement","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Retention Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Writer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Writer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Recipients","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Record Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Retention Management");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagement"
        {
            Credential           = $Credscredential;
            Description          = "Manage access control for Insider risk management in the Microsoft 365 Compliance Center.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagement";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Custodian","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Approval","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Audit","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Sessions","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Review","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementAdmins"
        {
            Credential           = $Credscredential;
            Description          = "Administrators of insider risk management that can create/edit policies and define global settings.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementAdmins";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementAnalysts"
        {
            Credential           = $Credscredential;
            Description          = "Analysts of insider risk management that can triage alerts, investigate and action on cases (but cannot explore content).";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementAnalysts";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementInvestigators"
        {
            Credential           = $Credscredential;
            Description          = "Investigators of insider risk management that can triage alerts, investigate and action on cases as well as explore content.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementInvestigators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Custodian","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Review","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-CommunicationComplianceInvestigators"
        {
            Credential           = $Credscredential;
            Description          = "Analysts of communication compliance that can investigate policy matches, view message content, and take remediation actions.";
            Ensure               = "Present";
            Name                 = "CommunicationComplianceInvestigators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Feedback Provider","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-CommunicationCompliance"
        {
            Credential           = $Credscredential;
            Description          = "Provides permission to all the communication compliance roles: administrator, analyst, investigator, and viewer.";
            Ensure               = "Present";
            Name                 = "CommunicationCompliance";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Feedback Provider","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagement"
        {
            Credential           = $Credscredential;
            Description          = "Manage access control for Privacy Management solution in the Microsoft 365 Compliance Center.";
            Ensure               = "Present";
            Name                 = "PrivacyManagement";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Content Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Permanent contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Temporary contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Subject Rights Request Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagementAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Administrators of privacy management solution that can create/edit policies and define global settings.";
            Ensure               = "Present";
            Name                 = "PrivacyManagementAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagementAnalysts"
        {
            Credential           = $Credscredential;
            Description          = "Analysts of privacy management solution that can investigate policy matches, view messages meta data, and take remediation actions.";
            Ensure               = "Present";
            Name                 = "PrivacyManagementAnalysts";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagementInvestigators"
        {
            Credential           = $Credscredential;
            Description          = "Analysts of privacy management solution that can investigate policy matches, view message content, and take remediation actions.";
            Ensure               = "Present";
            Name                 = "PrivacyManagementInvestigators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Content Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Investigation","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-SubjectRightsRequestAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Administrators who are able to create subject rights requests.";
            Ensure               = "Present";
            Name                 = "SubjectRightsRequestAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Subject Rights Request Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Case");
        }
        EXORoleGroup "EXORoleGroup-DataInvestigator"
        {
            Credential           = $Credscredential;
            Description          = "Perform searches on mailboxes, SharePoint Online sites, and OneDrive for Business locations.";
            Ensure               = "Present";
            Name                 = "DataInvestigator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Custodian","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Investigation Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Export","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Preview","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Review","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RMS Decrypt","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Search And Purge");
        }
        EXORoleGroup "EXORoleGroup-CommunicationComplianceAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Administrators of communication compliance that can create/edit policies and define global settings.";
            Ensure               = "Present";
            Name                 = "CommunicationComplianceAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager");
        }
        EXORoleGroup "EXORoleGroup-CommunicationComplianceAnalysts"
        {
            Credential           = $Credscredential;
            Description          = "Analysts of communication compliance that can investigate policy matches, view messages meta data, and take remediation actions.";
            Ensure               = "Present";
            Name                 = "CommunicationComplianceAnalysts";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Analysis","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management");
        }
        EXORoleGroup "EXORoleGroup-CommunicationComplianceViewers"
        {
            Credential           = $Credscredential;
            Description          = "Viewer of communication compliance that can access the available reports and widgets.";
            Ensure               = "Present";
            Name                 = "CommunicationComplianceViewers";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Case Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Communication Compliance Viewer");
        }
        EXORoleGroup "EXORoleGroup-ComplianceDataAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "Manage settings for device management, data protection, data loss prevention, reports, and preservation.";
            Ensure               = "Present";
            Name                 = "ComplianceDataAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Administration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Disposition Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analyst","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Organization Configuration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RecordManagement","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Retention Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Recipients","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Record Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Retention Management");
        }
        EXORoleGroup "EXORoleGroup-ComplianceManagerAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Manage template creation and modification.";
            Ensure               = "Present";
            Name                 = "ComplianceManagerAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Administration","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Assessment","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin");
        }
        EXORoleGroup "EXORoleGroup-ComplianceManagerAssessors"
        {
            Credential           = $Credscredential;
            Description          = "Create assessments, implement improvement actions, and update test status for improvement actions.";
            Ensure               = "Present";
            Name                 = "ComplianceManagerAssessors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Assessment","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin");
        }
        EXORoleGroup "EXORoleGroup-ComplianceManagerContributors"
        {
            Credential           = $Credscredential;
            Description          = "Create assessments and perform work to implement improvement actions.";
            Ensure               = "Present";
            Name                 = "ComplianceManagerContributors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Connector Admin");
        }
        EXORoleGroup "EXORoleGroup-SecurityReader"
        {
            Credential           = $Credscredential;
            Description          = "";
            Ensure               = "Present";
            Name                 = "SecurityReader";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts");
        }
        EXORoleGroup "EXORoleGroup-GlobalReader"
        {
            Credential           = $Credscredential;
            Description          = "View reports, alerts, and settings of security and compliance features.";
            Ensure               = "Present";
            Name                 = "GlobalReader";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Sensitivity Label Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Service Assurance View","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Recipients","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Record Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Retention Management");
        }
        EXORoleGroup "EXORoleGroup-ComplianceManagerReaders"
        {
            Credential           = $Credscredential;
            Description          = "View all Compliance Manager content except for administrator functions.";
            Ensure               = "Present";
            Name                 = "ComplianceManagerReaders";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagementViewers"
        {
            Credential           = $Credscredential;
            Description          = "Viewer of privacy management solution that can access the available dashboards and widgets.";
            Ensure               = "Present";
            Name                 = "PrivacyManagementViewers";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Viewer");
        }
        EXORoleGroup "EXORoleGroup-PrivacyManagementContributors"
        {
            Credential           = $Credscredential;
            Description          = "Manage contributor access for privacy management cases.";
            Ensure               = "Present";
            Name                 = "PrivacyManagementContributors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Permanent contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Privacy Management Temporary contribution");
        }
        EXORoleGroup "EXORoleGroup-SubjectRightsRequestApprovers"
        {
            Credential           = $Credscredential;
            Description          = "Approvers who are able to approve subject rights requests.";
            Ensure               = "Present";
            Name                 = "SubjectRightsRequestApprovers";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Manager Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Subject Rights Request Approver");
        }
        EXORoleGroup "EXORoleGroup-SecurityOperator"
        {
            Credential           = $Credscredential;
            Description          = "Manage security alerts, and also view reports and settings of security features.";
            Ensure               = "Present";
            Name                 = "SecurityOperator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Compliance Search","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Manage Alerts","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Security Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Contributor","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tag Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Tenant AllowBlockList Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Device Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only DLP Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only IB Compliance Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Manage Alerts");
        }
        EXORoleGroup "EXORoleGroup-DataSourceAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Data source administrators can manage data sources and data scans.";
            Ensure               = "Present";
            Name                 = "DataSourceAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Credential Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Credential Writer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Writer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Writer");
        }
        EXORoleGroup "EXORoleGroup-ContentExplorerContentViewer"
        {
            Credential           = $Credscredential;
            Description          = "Provides the ability to view the contents of the files.";
            Ensure               = "Present";
            Name                 = "ContentExplorerContentViewer";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Content Viewer");
        }
        EXORoleGroup "EXORoleGroup-InformationProtection"
        {
            Credential           = $Credscredential;
            Description          = "Full control over all information protection features, including sensitivity labels and their policies, DLP, all classifier types, activity and content explorers, and all related reports.";
            Ensure               = "Present";
            Name                 = "InformationProtection";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Content Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analyst","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Investigator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Purview Evaluation Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader");
        }
        EXORoleGroup "EXORoleGroup-InformationProtectionInvestigators"
        {
            Credential           = $Credscredential;
            Description          = "Access and manage DLP alerts, activity explorer, and content explorer. View-only access to DLP policies, sensitivity labels and their policies, and all classifier types.";
            Ensure               = "Present";
            Name                 = "InformationProtectionInvestigators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification Content Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analyst","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Investigator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Purview Evaluation Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader");
        }
        EXORoleGroup "EXORoleGroup-ContentExplorerListViewer"
        {
            Credential           = $Credscredential;
            Description          = "Provides the ability to view all items in Content explorer in list format only.";
            Ensure               = "Present";
            Name                 = "ContentExplorerListViewer";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer");
        }
        EXORoleGroup "EXORoleGroup-InformationProtectionAnalysts"
        {
            Credential           = $Credscredential;
            Description          = "Access and manage DLP alerts and activity explorer. View-only access to DLP policies, sensitivity labels and their policies, and all classifier types.";
            Ensure               = "Present";
            Name                 = "InformationProtectionAnalysts";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Classification List Viewer","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Analyst","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Purview Evaluation Administrator");
        }
        EXORoleGroup "EXORoleGroup-InformationProtectionAdmins"
        {
            Credential           = $Credscredential;
            Description          = "Create, edit, and delete DLP policies, sensitivity labels and their policies, and all classifier types. Manage endpoint DLP settings and simulation mode for auto-labeling policies.";
            Ensure               = "Present";
            Name                 = "InformationProtectionAdmins";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Admin","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Purview Evaluation Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scan Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Source Reader");
        }
        EXORoleGroup "EXORoleGroup-DataCatalogCurators"
        {
            Credential           = $Credscredential;
            Description          = "Data Catalog curators can perform create, read, modify, and delete actions on catalog data objects and establish relationships between objects.";
            Ensure               = "Present";
            Name                 = "DataCatalogCurators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Writer");
        }
        EXORoleGroup "EXORoleGroup-DataEstateInsightsReaders"
        {
            Credential           = $Credscredential;
            Description          = "A role group that provides read-only access to all insights reports across platforms and providers.";
            Ensure               = "Present";
            Name                 = "DataEstateInsightsReaders";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader");
        }
        EXORoleGroup "EXORoleGroup-DataEstateInsightsAdmins"
        {
            Credential           = $Credscredential;
            Description          = "A role group that provides admin access to all insights reports across platforms and providers.";
            Ensure               = "Present";
            Name                 = "DataEstateInsightsAdmins";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Data Map Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Reader","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insights Writer");
        }
        EXORoleGroup "EXORoleGroup-RecordsManagement"
        {
            Credential           = $Credscredential;
            Description          = "Members of this management role group have permissions to manage and dispose record content.";
            Ensure               = "Present";
            Name                 = "RecordsManagement";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Disposition Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/RecordManagement","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Retention Management","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Scope Manager");
        }
        EXORoleGroup "EXORoleGroup-ExactDataMatchUploadAdmins"
        {
            Credential           = $Credscredential;
            Description          = "Upload data for Exact Data Match";
            Ensure               = "Present";
            Name                 = "ExactDataMatchUploadAdmins";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Exact Data Match Upload Admin");
        }
        EXORoleGroup "EXORoleGroup-MailFlowAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "";
            Ensure               = "Present";
            Name                 = "MailFlowAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Exchange Administrator","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Recipients");
        }
        EXORoleGroup "EXORoleGroup-InformationProtectionReaders"
        {
            Credential           = $Credscredential;
            Description          = "View-only access to reports for DLP policies and sensitivity labels and their policies.";
            Ensure               = "Present";
            Name                 = "InformationProtectionReaders";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Information Protection Reader");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementApprovers"
        {
            Credential           = $Credscredential;
            Description          = "For internal approval use only.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementApprovers";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Approval");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementAuditors"
        {
            Credential           = $Credscredential;
            Description          = "Auditors of insider risk management that can view the audit logs of actions performed by Analysts, Investigators and Administrators.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementAuditors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Audit");
        }
        EXORoleGroup "EXORoleGroup-IRMContributors"
        {
            Credential           = $Credscredential;
            Description          = "Manage contributor access for Insider risk management.";
            Ensure               = "Present";
            Name                 = "IRMContributors";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Permanent contribution","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Temporary contribution");
        }
        EXORoleGroup "EXORoleGroup-InsiderRiskManagementSessionApprovers"
        {
            Credential           = $Credscredential;
            Description          = "For internal approval use only.";
            Ensure               = "Present";
            Name                 = "InsiderRiskManagementSessionApprovers";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Insider Risk Management Sessions");
        }
        EXORoleGroup "EXORoleGroup-KnowledgeAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Can configure knowledge, learning, assign trainings and other intelligent features. ";
            Ensure               = "Present";
            Name                 = "KnowledgeAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Knowledge Admin");
        }
        EXORoleGroup "EXORoleGroup-PurviewAdministrators"
        {
            Credential           = $Credscredential;
            Description          = "Purview Administrators can create, edit and delete domains and perform role assignments.";
            Ensure               = "Present";
            Name                 = "PurviewAdministrators";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Purview Domain Manager","FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Role Management");
        }
        EXORoleGroup "EXORoleGroup-QuarantineAdministrator"
        {
            Credential           = $Credscredential;
            Description          = "Manage and control quarantined messages.";
            Ensure               = "Present";
            Name                 = "QuarantineAdministrator";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Quarantine");
        }
        EXORoleGroup "EXORoleGroup-Reviewer"
        {
            Credential           = $Credscredential;
            Description          = "Use a limited set of the analysis features in Office 365 Advanced eDiscovery. Members of this group can see only the documents that are assigned to them.";
            Ensure               = "Present";
            Name                 = "Reviewer";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Review");
        }
        EXORoleGroup "EXORoleGroup-ServiceAssuranceUser"
        {
            Credential           = $Credscredential;
            Description          = "Access the Service Assurance section in the Security & Compliance Center. Members of this role group can use this section to review documents related to security, privacy, and compliance in Office 365 to perform risk and assurance reviews for their own organization.";
            Ensure               = "Present";
            Name                 = "ServiceAssuranceUser";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Service Assurance View");
        }
        EXORoleGroup "EXORoleGroup-SupervisoryReview"
        {
            Credential           = $Credscredential;
            Description          = "Control policies and permissions for reviewing employee communications.";
            Ensure               = "Present";
            Name                 = "SupervisoryReview";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/Supervisory Review Administrator");
        }
        EXORoleGroup "EXORoleGroup-AuditReader"
        {
            Credential           = $Credscredential;
            Description          = "Search, View, and Export Audit logs.";
            Ensure               = "Present";
            Name                 = "AuditReader";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/View-Only Audit Logs");
        }
        EXORoleGroup "EXORoleGroup-DefaultRoleAssignmentPolicy"
        {
            Credential           = $Credscredential;
            Description          = "";
            Ensure               = "Present";
            Name                 = "DefaultRoleAssignmentPolicy";
            Roles                = @("FFO.extest.microsoft.com/Microsoft Exchange Hosted Organizations/$OrganizationName/MyBaseOptions");
        }
        EXOSafeAttachmentPolicy "EXOSafeAttachmentPolicy-Built-In Protection Policy"
        {
            Action               = "Block";
            AdminDisplayName     = "";
            Credential           = $Credscredential;
            Enable               = $True;
            Ensure               = "Present";
            Identity             = "Built-In Protection Policy";
            QuarantineTag        = "AdminOnlyAccessPolicy";
            Redirect             = $False;
            RedirectAddress      = "";
        }
        EXOSafeLinksPolicy "EXOSafeLinksPolicy-Built-In Protection Policy"
        {
            AdminDisplayName           = "";
            AllowClickThrough          = $True;
            Credential                 = $Credscredential;
            CustomNotificationText     = "";
            DeliverMessageAfterScan    = $True;
            DisableUrlRewrite          = $True;
            DoNotRewriteUrls           = @();
            EnableForInternalSenders   = $False;
            EnableOrganizationBranding = $False;
            EnableSafeLinksForEmail    = $True;
            EnableSafeLinksForOffice   = $True;
            EnableSafeLinksForTeams    = $True;
            Ensure                     = "Present";
            Identity                   = "Built-In Protection Policy";
            ScanUrls                   = $True;
            TrackClicks                = $True;
        }
        EXOSharingPolicy "EXOSharingPolicy-Default Sharing Policy"
        {
            Credential           = $Credscredential;
            Default              = $True;
            Domains              = @("Anonymous:CalendarSharingFreeBusyReviewer","*:CalendarSharingFreeBusySimple");
            Enabled              = $True;
            Ensure               = "Present";
            Name                 = "Default Sharing Policy";
        }
        EXOTransportConfig "EXOTransportConfig"
        {
            AddressBookPolicyRoutingEnabled         = $False;
            AllowLegacyTLSClients                   = $False;
            ClearCategories                         = $True;
            ConvertDisclaimerWrapperToEml           = $False;
            Credential                              = $Credscredential;
            DSNConversionMode                       = "PreserveDSNBody";
            ExternalDelayDsnEnabled                 = $True;
            ExternalDsnLanguageDetectionEnabled     = $True;
            ExternalDsnSendHtml                     = $True;
            HeaderPromotionModeSetting              = "NoCreate";
            InternalDelayDsnEnabled                 = $True;
            InternalDsnLanguageDetectionEnabled     = $True;
            InternalDsnSendHtml                     = $True;
            IsSingleInstance                        = "Yes";
            JournalingReportNdrTo                   = "<>";
            JournalMessageExpirationDays            = 0;
            MaxRecipientEnvelopeLimit               = "Unlimited";
            ReplyAllStormBlockDurationHours         = 6;
            ReplyAllStormDetectionMinimumRecipients = 2500;
            ReplyAllStormDetectionMinimumReplies    = 10;
            ReplyAllStormProtectionEnabled          = $True;
            Rfc2231EncodingEnabled                  = $False;
            SmtpClientAuthenticationDisabled        = $True;
        }
        IntuneDeviceCleanupRule "IntuneDeviceCleanupRule"
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            Ensure               = "Present";
            IsSingleInstance     = "Yes";
        }
        O365AdminAuditLogConfig "O365AdminAuditLogConfig"
        {
            Credential                      = $Credscredential;
            IsSingleInstance                = "Yes";
            UnifiedAuditLogIngestionEnabled = "Disabled";
        }
        O365OrgSettings "O365OrgSettings"
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }
        ODSettings "ODSettings"
        {
            BlockMacSync                              = $False;
            Credential                                = $Credscredential;
            DisableReportProblemDialog                = $False;
            DomainGuids                               = @();
            Ensure                                    = "Present";
            ExcludedFileExtensions                    = @();
            IsSingleInstance                          = "Yes";
            NotificationsInOneDriveForBusinessEnabled = $True;
            NotifyOwnersWhenInvitationsAccepted       = $True;
            ODBAccessRequests                         = "Unspecified";
            ODBMembersCanShare                        = "Unspecified";
            OneDriveForGuestsEnabled                  = $False;
            OneDriveStorageQuota                      = 1048576;
            OrphanedPersonalSitesRetentionPeriod      = 30;
            TenantRestrictionEnabled                  = $False;
        }
        PPTenantIsolationSettings "PPTenantIsolationSettings"
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            IsSingleInstance     = "Yes";
        }
        SCDLPCompliancePolicy "SCDLPCompliancePolicy-Default policy for Teams"
        {
            Comment                               = "This policy detects the presence of credit card numbers in Teams chats and channel messages. When this sensitive info is detected, admins will receive an alert but policy tips won't be displayed to users. You can edit these actions at any time.";
            Credential                            = $Credscredential;
            EndpointDlpLocationException          = @();
            Ensure                                = "Present";
            ExchangeSenderMemberOf                = @();
            ExchangeSenderMemberOfException       = @();
            Mode                                  = "Enable";
            Name                                  = "Default policy for Teams";
            OneDriveLocationException             = @();
            OnPremisesScannerDlpLocationException = @();
            PowerBIDlpLocationException           = @();
            Priority                              = 0;
            SharePointLocationException           = @();
            TeamsLocation                         = "All";
            TeamsLocationException                = @();
            ThirdPartyAppDlpLocationException     = @();
        }
        SCDLPCompliancePolicy "SCDLPCompliancePolicy-Default policy for devices"
        {
            Comment                               = "This policy detects the presence of credit card numbers in files on devices when users perform specific activities (such as printing a file). When detected, the activity is only audited (not blocked). Admins will receive an alert, but policy tips won't be displayed to users. You can edit these actions at any time.";
            Credential                            = $Credscredential;
            EndpointDlpLocation                   = "All";
            EndpointDlpLocationException          = @();
            Ensure                                = "Present";
            ExchangeSenderMemberOf                = @();
            ExchangeSenderMemberOfException       = @();
            Mode                                  = "Enable";
            Name                                  = "Default policy for devices";
            OneDriveLocationException             = @();
            OnPremisesScannerDlpLocationException = @();
            PowerBIDlpLocationException           = @();
            Priority                              = 1;
            SharePointLocationException           = @();
            TeamsLocationException                = @();
            ThirdPartyAppDlpLocationException     = @();
        }
        SCDLPComplianceRule "SCDLPComplianceRule-Default Endpoint DLP Policy Rule - Low Volume"
        {
            BlockAccess                         = $False;
            Comment                             = "This rule is matched if 1 to 9 credit card numbers are detected in a file when a user performs certain device-related activities. When detected within a 24-hour period, the activity is only audited (not blocked). Admins won't receive alerts.";
            ContentContainsSensitiveInformation = MSFT_SCDLPContainsSensitiveInformation
            {
                SensitiveInformation = @(
MSFT_SCDLPSensitiveInformation
            {
                name = 'Credit Card Number'
                id = '50842eb7-edc8-4019-85dd-5a5c1f2bb085'
                maxconfidence = '100'
                minconfidence = '85'
                classifiertype = 'Content'
                mincount = '1'
                maxcount = '9'
            }
            )            };
            Credential                          = $Credscredential;
            Disabled                            = $False;
            DocumentIsPasswordProtected         = $False;
            DocumentIsUnsupported               = $False;
            Ensure                              = "Present";
            ExceptIfDocumentIsPasswordProtected = $False;
            ExceptIfDocumentIsUnsupported       = $False;
            ExceptIfHasSenderOverride           = $False;
            ExceptIfProcessingLimitExceeded     = $False;
            HasSenderOverride                   = $False;
            Name                                = "Default Endpoint DLP Policy Rule - Low Volume";
            Policy                              = "Default policy for devices";
            ProcessingLimitExceeded             = $False;
            RemoveRMSTemplate                   = $False;
            ReportSeverityLevel                 = "Low";
            StopPolicyProcessing                = $False;
        }
        SCDLPComplianceRule "SCDLPComplianceRule-Default Endpoint DLP Policy Rule - High Volume"
        {
            BlockAccess                         = $False;
            Comment                             = "This rule is matched if 10 or more credit card numbers are detected in a file when a user performs certain device-related activities. When detected within a 24-hour period, the activity is only audited (not blocked), and admins will be alerted in email.";
            ContentContainsSensitiveInformation = MSFT_SCDLPContainsSensitiveInformation
            {
                SensitiveInformation = @(
MSFT_SCDLPSensitiveInformation
            {
                name = 'Credit Card Number'
                id = '50842eb7-edc8-4019-85dd-5a5c1f2bb085'
                maxconfidence = '100'
                minconfidence = '85'
                classifiertype = 'Content'
                mincount = '10'
                maxcount = '-1'
            }
            )            };
            Credential                          = $Credscredential;
            Disabled                            = $False;
            DocumentIsPasswordProtected         = $False;
            DocumentIsUnsupported               = $False;
            Ensure                              = "Present";
            ExceptIfDocumentIsPasswordProtected = $False;
            ExceptIfDocumentIsUnsupported       = $False;
            ExceptIfHasSenderOverride           = $False;
            ExceptIfProcessingLimitExceeded     = $False;
            HasSenderOverride                   = $False;
            Name                                = "Default Endpoint DLP Policy Rule - High Volume";
            Policy                              = "Default policy for devices";
            ProcessingLimitExceeded             = $False;
            RemoveRMSTemplate                   = $False;
            ReportSeverityLevel                 = "Medium";
            StopPolicyProcessing                = $False;
        }
        SCDLPComplianceRule "SCDLPComplianceRule-Default Teams DLP policy rule"
        {
            BlockAccess                         = $False;
            Comment                             = "This rule detects the presence of one or more credit card numbers. Admins will be alerted in email when 10 or more instances are detected within a 24-hour period for all users.";
            ContentContainsSensitiveInformation = MSFT_SCDLPContainsSensitiveInformation
            {
                SensitiveInformation = @(
MSFT_SCDLPSensitiveInformation
            {
                name = 'Credit Card Number'
                id = '50842eb7-edc8-4019-85dd-5a5c1f2bb085'
                maxconfidence = '100'
                minconfidence = '85'
                classifiertype = 'Content'
                mincount = '1'
                maxcount = '-1'
            }
            )            };
            Credential                          = $Credscredential;
            Disabled                            = $False;
            DocumentIsPasswordProtected         = $False;
            DocumentIsUnsupported               = $False;
            Ensure                              = "Present";
            ExceptIfDocumentIsPasswordProtected = $False;
            ExceptIfDocumentIsUnsupported       = $False;
            ExceptIfHasSenderOverride           = $False;
            ExceptIfProcessingLimitExceeded     = $False;
            GenerateIncidentReport              = @("SiteAdmin");
            HasSenderOverride                   = $False;
            IncidentReportContent               = @("Title","DocumentAuthor","DocumentLastModifier","Service","MatchedItem","RulesMatched","Detections","Severity","RetentionLabel","SensitivityLabel");
            Name                                = "Default Teams DLP policy rule";
            Policy                              = "Default policy for Teams";
            ProcessingLimitExceeded             = $False;
            RemoveRMSTemplate                   = $False;
            ReportSeverityLevel                 = "Low";
            StopPolicyProcessing                = $False;
        }
        SCFilePlanPropertyAuthority "SCFilePlanPropertyAuthority-Business"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Business";
        }
        SCFilePlanPropertyAuthority "SCFilePlanPropertyAuthority-Legal"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal";
        }
        SCFilePlanPropertyAuthority "SCFilePlanPropertyAuthority-Regulatory"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Regulatory";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Accounts payable"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Accounts payable";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Accounts receivable"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Accounts receivable";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Administration"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Administration";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Compliance"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Compliance";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Contracting"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Contracting";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Financial statements"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Financial statements";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Learning and development"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Learning and development";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Planning"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Planning";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Payroll"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Payroll";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Policies and procedures"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Policies and procedures";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Procurement"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Procurement";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Recruiting and hiring"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Recruiting and hiring";
        }
        SCFilePlanPropertyCategory "SCFilePlanPropertyCategory-Research and development"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Research and development";
        }
        SCFilePlanPropertyCitation "SCFilePlanPropertyCitation-Commodity Exchange Act"
        {
            CitationJurisdiction = "U.S. Futures Commodity Trading Commission (UCFTC)";
            CitationUrl          = "https://www.cftc.gov/LawRegulation/CommodityExchangeAct/index.htm";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Commodity Exchange Act";
        }
        SCFilePlanPropertyCitation "SCFilePlanPropertyCitation-Sarbanes-Oxley Act of 2002"
        {
            CitationJurisdiction = "U.S. Securities and Exchange Commission (SEC)";
            CitationUrl          = "https://www.sec.gov/answers/about-lawsshtml.html#sox2002";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Sarbanes-Oxley Act of 2002";
        }
        SCFilePlanPropertyCitation "SCFilePlanPropertyCitation-Truth in lending Act"
        {
            CitationJurisdiction = "Federal Trade Commission (FTC)";
            CitationUrl          = "https://www.ftc.gov/enforcement/statutes/truth-lending-act";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Truth in lending Act";
        }
        SCFilePlanPropertyCitation "SCFilePlanPropertyCitation-Health Insurance Portability and Accountability Act of 1996"
        {
            CitationJurisdiction = "U.S. Department of Health & Human Services (HHS)";
            CitationUrl          = "https://aspe.hhs.gov/report/health-insurance-portability-and-accountability-act-1996";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Health Insurance Portability and Accountability Act of 1996";
        }
        SCFilePlanPropertyCitation "SCFilePlanPropertyCitation-OSHA Injury and Illness Recordkeeping and Reporting Requirements"
        {
            CitationJurisdiction = "U.S. Department of Labor (DOL)";
            CitationUrl          = "https://www.osha.gov/recordkeeping/index.html";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "OSHA Injury and Illness Recordkeeping and Reporting Requirements";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Finance"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Finance";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Human resources"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Human resources";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Information technology"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information technology";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Legal"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Marketing"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Marketing";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Operations"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Operations";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Procurement"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Procurement";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Products"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Products";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Sales"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Sales";
        }
        SCFilePlanPropertyDepartment "SCFilePlanPropertyDepartment-Services"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Services";
        }
        SCLabelPolicy "SCLabelPolicy-Global sensitivity label policy"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'mandatory'
                    Value = 'false'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'powerbimandatory'
                    Value = 'false'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'outlookdefaultlabel'
                    Value = 'All Employees (unrestricted)'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'requiredowngradejustification'
                    Value = 'true'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'defaultlabelid'
                    Value = 'All Employees (unrestricted)'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'disablemandatoryinoutlook'
                    Value = 'true'
                }
            );
            Comment              = "Default sensitivity label policy for all users and groups.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            ExchangeLocation     = "All";
            Labels               = @("defa4170-0d19-0005-0000-bc88714345d2","defa4170-0d19-0005-0004-bc88714345d2","defa4170-0d19-0005-0001-bc88714345d2","defa4170-0d19-0005-0006-bc88714345d2","defa4170-0d19-0005-0005-bc88714345d2","defa4170-0d19-0005-0003-bc88714345d2","defa4170-0d19-0005-0002-bc88714345d2","defa4170-0d19-0005-0007-bc88714345d2","defa4170-0d19-0005-000b-bc88714345d2","defa4170-0d19-0005-0008-bc88714345d2","defa4170-0d19-0005-0009-bc88714345d2","defa4170-0d19-0005-000a-bc88714345d2");
            Name                 = "Global sensitivity label policy";
        }
        SCProtectionAlert "SCProtectionAlert-CC_User-reported messages"
        {
            AggregationType         = "None";
            Category                = "Supervision";
            Comment                 = "";
            Credential              = $Credscredential;
            Disabled                = $False;
            Ensure                  = "Present";
            Filter                  = "SRPolicyMatchDetails.SRPolicyName -eq 'User-reported messages'";
            Name                    = "CC_User-reported messages";
            NotificationEnabled     = $False;
            NotifyUser              = @("paki.a@$OrganizationName","Admin-US@$OrganizationName","adminJoe-US@$OrganizationName","admin@$OrganizationName");
            NotifyUserOnFilterMatch = $False;
            Operation               = @("SupervisionRuleMatch");
            Severity                = "Medium";
            ThreatType              = "Activity";
        }
        SCRetentionEventType "SCRetentionEventType-Employee activity"
        {
            Comment              = "Processes related to hiring, performance and termination of an employee.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Employee activity";
        }
        SCRetentionEventType "SCRetentionEventType-Expiration or termination of contracts and agreements"
        {
            Comment              = "Expiration or termination of various executed contracts and agreements such as business contracts, leases, license agreements and contingent staff agreements.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Expiration or termination of contracts and agreements";
        }
        SCRetentionEventType "SCRetentionEventType-Product lifetime"
        {
            Comment              = "Processes related to last manufacturing date of products.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Product lifetime";
        }
        SCSensitivityLabel "SCSensitivityLabel-Personal"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "Personal";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Personal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Personal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Persönlich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnel'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Personale'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '個人用'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '개인용'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Личное'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '个人'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '個人'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Non-business data, for personal use only.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Personal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Persönlich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnel'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Personale'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '個人用'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '개인용'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoal'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Личное'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '个人'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '個人'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0000-bc88714345d2";
            Priority             = 0;
            Tooltip              = "Non-business data, for personal use only.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Public"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "Public";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Public'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Public'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Öffentlich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Público'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Public'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Pubblico'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '公共'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '공개'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Público'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Открытый доступ'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '公用'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '公用'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Business data that is specifically prepared and approved for public consumption.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Public'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Öffentlich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Público'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Public'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Pubblico'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '公共'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '공개'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Público'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Открытый доступ'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '公用'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '公用'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0001-bc88714345d2";
            Priority             = 1;
            Tooltip              = "Business data that is specifically prepared and approved for public consumption.";
        }
        SCSensitivityLabel "SCSensitivityLabel-General"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "General";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'General'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'General'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Allgemein'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'General'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Général'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Generale'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '一般'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '일반'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Geral'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Общее'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '常规'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '一般'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'General'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Allgemein'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'General'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Général'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Generale'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '一般'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '일반'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Geral'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Общее'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '常规'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '一般'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0002-bc88714345d2";
            Priority             = 2;
            Tooltip              = "Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Anyone (unrestricted)"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0002-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "Anyone (unrestricted)";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Jeder (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Cualquiera (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tout le monde (sans restriction)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Chiunque (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 사용자(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Qualquer pessoa (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '任何人(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '任何人 (無限制)'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Organization data that isn''t intended for public consumption but can be shared with external partners if appropriate. Examples include customer conversations that don''t include sensitive info or released marketing materials.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Jeder (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Cualquiera (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tout le monde (sans restriction)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Chiunque (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 사용자(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Qualquer pessoa (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '任何人(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '任何人 (無限制)'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0003-bc88714345d2";
            ParentId             = "defa4170-0d19-0005-0002-bc88714345d2";
            Priority             = 3;
            Tooltip              = "Organization data that isn't intended for public consumption but can be shared with external partners if appropriate. Examples include customer conversations that don't include sensitive info or released marketing materials.";
        }
        SCSensitivityLabel "SCSensitivityLabel-All Employees (unrestricted)"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0002-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "All Employees (unrestricted)";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'All Employees (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés (non restreint)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工 (無限制)'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Organization data that isn''t intended for public consumption. If you need to share this content with external partners, make sure it''s appropriate with data owners and relabel content as General/Anyone (unrestricted). Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés (non restreint)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工 (無限制)'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0004-bc88714345d2";
            ParentId             = "defa4170-0d19-0005-0002-bc88714345d2";
            Priority             = 4;
            Tooltip              = "Organization data that isn't intended for public consumption. If you need to share this content with external partners, make sure it's appropriate with data owners and relabel content as General/Anyone (unrestricted). Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Confidential"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "Confidential";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Confidential'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Vertraulich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Confidencial'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Confidentiel'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Riservato'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '機密'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '기밀'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Confidencial'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Конфиденциально'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '机密'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '保密'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Confidential'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Vertraulich'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Confidencial'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Confidentiel'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Riservato'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '機密'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '기밀'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Confidencial'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Конфиденциально'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '机密'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '保密'
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0005-bc88714345d2";
            Priority             = 5;
            Tooltip              = "Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Anyone (unrestricted)-2"
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0005-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = "8";
            ApplyContentMarkingFooterMargin    = "5";
            ApplyContentMarkingFooterText      = "Classified as Confidential";
            Comment                            = "";
            ContentType                        = @("File, Email");
            Credential                         = $Credscredential;
            DisplayName                        = "Anyone (unrestricted)";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Jeder (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Cualquiera (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tout le monde (sans restriction)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Chiunque (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 사용자(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Qualquer pessoa (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '任何人(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '任何人 (無限制)'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Data that does not require protection. Use this option with care and with appropriate business justification.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Jeder (uneingeschränkt)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Cualquiera (sin restricciones)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tout le monde (sans restriction)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Chiunque (senza restrizioni)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Anyone (unrestricted)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 사용자(제한 없음)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Qualquer pessoa (irrestrito)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все (без ограничений)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '任何人(不受限制)'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '任何人 (無限制)'
                        }
                    )
                }
            );
            Name                               = "defa4170-0d19-0005-0006-bc88714345d2";
            ParentId                           = "defa4170-0d19-0005-0005-bc88714345d2";
            Priority                           = 6;
            Tooltip                            = "Data that does not require protection. Use this option with care and with appropriate business justification.";
        }
        SCSensitivityLabel "SCSensitivityLabel-All Employees"
        {
            AdvancedSettings                            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0005-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            ApplyContentMarkingFooterAlignment          = "Left";
            ApplyContentMarkingFooterEnabled            = $True;
            ApplyContentMarkingFooterFontColor          = "#000000";
            ApplyContentMarkingFooterFontSize           = "8";
            ApplyContentMarkingFooterMargin             = "5";
            ApplyContentMarkingFooterText               = "Classified as Confidential";
            Comment                                     = "";
            ContentType                                 = @("File, Email");
            Credential                                  = $Credscredential;
            DisplayName                                 = "All Employees";
            EncryptionContentExpiredOnDateInDaysOrNever = "Never";
            EncryptionEnabled                           = $True;
            EncryptionOfflineAccessDays                 = "-1";
            EncryptionProtectionType                    = "template";
            EncryptionRightsDefinitions                 = "$($OrganizationName):VIEW,VIEWRIGHTSDATA,DOCEDIT,EDIT,PRINT,EXTRACT,REPLY,REPLYALL,FORWARD,OBJMODEL";
            Ensure                                      = "Present";
            LocaleSettings                              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工'
                        }
                    )
                }
            );
            Name                                        = "defa4170-0d19-0005-0007-bc88714345d2";
            ParentId                                    = "defa4170-0d19-0005-0005-bc88714345d2";
            Priority                                    = 7;
            Tooltip                                     = "Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Trusted People"
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0005-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = "10";
            ApplyContentMarkingFooterMargin    = "5";
            ApplyContentMarkingFooterText      = "Classified as Confidential";
            Comment                            = "";
            ContentType                        = @("File, Email");
            Credential                         = $Credscredential;
            DisplayName                        = "Trusted People";
            EncryptionDoNotForward             = $False;
            EncryptionEnabled                  = $True;
            EncryptionEncryptOnly              = $True;
            EncryptionPromptUser               = $True;
            EncryptionProtectionType           = "userdefined";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Trusted People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Trusted People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Vertrauenswürdige Personen'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personas de confianza'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnes Autorisées'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Persone attendibili'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Trusted People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '신뢰하는 사용자'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoas confiáveis'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Доверенные лица'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '受信任的人员'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '受信任人員'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential data for internal/external sharing that can be reshared by trusted recipients.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Trusted People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Vertrauenswürdige Personen'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personas de confianza'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnes Autorisées'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Persone attendibili'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Trusted People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '신뢰하는 사용자'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoas confiáveis'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Доверенные лица'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '受信任的人员'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '受信任人員'
                        }
                    )
                }
            );
            Name                               = "defa4170-0d19-0005-0008-bc88714345d2";
            ParentId                           = "defa4170-0d19-0005-0005-bc88714345d2";
            Priority                           = 8;
            Tooltip                            = "Confidential data for internal/external sharing that can be reshared by trusted recipients.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Highly Confidential"
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            Comment              = "";
            ContentType          = @("File, Email");
            Credential           = $Credscredential;
            DisplayName          = "Highly Confidential";
            Ensure               = "Present";
            LocaleSettings       = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly Confidential'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Highly Confidential '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Streng vertraulich '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Extremadamente confidencial '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Hautement Confidentiel '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Strettamente riservato '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Highly Confidential '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '높은 기밀 '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Altamente Confidencial '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Строго конфиденциально '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '高度机密 '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '高度機密 '
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Highly Confidential '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Streng vertraulich '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Extremadamente confidencial '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Hautement Confidentiel '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Strettamente riservato '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'Highly Confidential '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '높은 기밀 '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Altamente Confidencial '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Строго конфиденциально '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '高度机密 '
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '高度機密 '
                        }
                    )
                }
            );
            Name                 = "defa4170-0d19-0005-0009-bc88714345d2";
            Priority             = 9;
            Tooltip              = "Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.";
        }
        SCSensitivityLabel "SCSensitivityLabel-All Employees-2"
        {
            AdvancedSettings                            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0009-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            ApplyContentMarkingFooterAlignment          = "Left";
            ApplyContentMarkingFooterEnabled            = $True;
            ApplyContentMarkingFooterFontColor          = "#000000";
            ApplyContentMarkingFooterFontSize           = "8";
            ApplyContentMarkingFooterMargin             = "5";
            ApplyContentMarkingFooterText               = "Classified as Highly Confidential";
            Comment                                     = "";
            ContentType                                 = @("File, Email");
            Credential                                  = $Credscredential;
            DisplayName                                 = "All Employees";
            EncryptionContentExpiredOnDateInDaysOrNever = "Never";
            EncryptionEnabled                           = $True;
            EncryptionOfflineAccessDays                 = "-1";
            EncryptionProtectionType                    = "template";
            EncryptionRightsDefinitions                 = "$($OrganizationName):VIEW,VIEWRIGHTSDATA,DOCEDIT,EDIT,PRINT,EXTRACT,REPLY,REPLYALL,FORWARD,OBJMODEL";
            Ensure                                      = "Present";
            LocaleSettings                              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Alle Mitarbeiter'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Todos los empleados'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Tous les Employés'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Tutti i dipendenti'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = 'All Employees'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '모든 직원'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Todos os Funcionários'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Все сотрудники'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '所有员工'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '所有員工'
                        }
                    )
                }
            );
            Name                                        = "defa4170-0d19-0005-000a-bc88714345d2";
            ParentId                                    = "defa4170-0d19-0005-0009-bc88714345d2";
            Priority                                    = 10;
            Tooltip                                     = "Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.";
        }
        SCSensitivityLabel "SCSensitivityLabel-Specified People"
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'defa4170-0d19-0005-0009-bc88714345d2'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'isparent'
                    Value = 'False'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = "10";
            ApplyContentMarkingFooterMargin    = "5";
            ApplyContentMarkingFooterText      = "Classified as Highly Confidential";
            Comment                            = "";
            ContentType                        = @("File, Email");
            Credential                         = $Credscredential;
            DisplayName                        = "Specified People";
            EncryptionDoNotForward             = $True;
            EncryptionEnabled                  = $True;
            EncryptionEncryptOnly              = $False;
            EncryptionPromptUser               = $True;
            EncryptionProtectionType           = "userdefined";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Specified People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Specific People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Bestimmte Personen'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personas específicas'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnes Spécifiques'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Persone specifiche'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '特定の People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '특정 사용자'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoas específicas'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Определенные пользователи'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '特定人员'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '特定人員'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    LabelSettings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly Confidential data that requires protection and that can only be viewed by specified people, with limited rights.'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'en-US'
                            Value = 'Specific People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'de-DE'
                            Value = 'Bestimmte Personen'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'es-ES'
                            Value = 'Personas específicas'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'fr-FR'
                            Value = 'Personnes Spécifiques'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'it-IT'
                            Value = 'Persone specifiche'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ja-JP'
                            Value = '特定の People'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ko-KR'
                            Value = '특정 사용자'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'pt-BR'
                            Value = 'Pessoas específicas'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'ru-RU'
                            Value = 'Определенные пользователи'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-CN'
                            Value = '特定人员'
                        }
                        MSFT_SCLabelSetting
                        {
                            Key   = 'zh-TW'
                            Value = '特定人員'
                        }
                    )
                }
            );
            Name                               = "defa4170-0d19-0005-000b-bc88714345d2";
            ParentId                           = "defa4170-0d19-0005-0009-bc88714345d2";
            Priority                           = 11;
            Tooltip                            = "Highly Confidential data that requires protection and that can only be viewed by specified people, with limited rights.";
        }
        SCSupervisoryReviewPolicy "SCSupervisoryReviewPolicy-User-reported messages"
        {
            Comment              = "This policy was automatically created by Microsoft to detect Teams messages that users reported as inappropriate.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "User-reported messages";
            Reviewers            = @("paki.a@$OrganizationName","Admin-US@$OrganizationName","adminJoe-US@$OrganizationName","admin@$OrganizationName");
        }
        SCSupervisoryReviewRule "SCSupervisoryReviewRule-User-reported messages"
        {
            Condition            = "((((Direction:Outbound) OR (Direction:Inbound) OR (Direction:Internal))) AND (((Reviewee:AllUsersGroupsOfTenant))))";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "User-reported messages";
            Policy               = "User-reported messages";
            SamplingRate         = "0";
        }
        SPOAccessControlSettings "SPOAccessControlSettings"
        {
            CommentsOnSitePagesDisabled  = $False;
            Credential                   = $Credscredential;
            DisallowInfectedFileDownload = $False;
            DisplayStartASiteOption      = $True;
            EmailAttestationReAuthDays   = 30;
            EmailAttestationRequired     = $False;
            Ensure                       = "Present";
            ExternalServicesEnabled      = $True;
            IPAddressAllowList           = "";
            IPAddressEnforcement         = $False;
            IPAddressWACTokenLifetime    = 15;
            IsSingleInstance             = "Yes";
            SocialBarOnSitePagesDisabled = $False;
        }
        SPOBrowserIdleSignout "SPOBrowserIdleSignout"
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            IsSingleInstance     = "Yes";
            SignOutAfter         = "00:00:00";
            WarnAfter            = "00:00:00";
        }
        SPOHomeSite "SPOHomeSite"
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }
        SPOSharingSettings "SPOSharingSettings"
        {
            BccExternalSharingInvitations              = $False;
            Credential                                 = $Credscredential;
            DefaultLinkPermission                      = "Edit";
            DefaultSharingLinkType                     = "AnonymousAccess";
            EnableGuestSignInAcceleration              = $False;
            Ensure                                     = "Present";
            FileAnonymousLinkType                      = "Edit";
            FolderAnonymousLinkType                    = "Edit";
            IsSingleInstance                           = "Yes";
            MySiteSharingCapability                    = "ExternalUserAndGuestSharing";
            NotifyOwnersWhenItemsReshared              = $True;
            PreventExternalUsersFromResharing          = $False;
            ProvisionSharedWithEveryoneFolder          = $False;
            RequireAcceptingAccountMatchInvitedAccount = $False;
            SharingCapability                          = "ExternalUserAndGuestSharing";
            SharingDomainRestrictionMode               = "None";
            ShowAllUsersClaim                          = $False;
            ShowEveryoneClaim                          = $False;
            ShowEveryoneExceptExternalUsersClaim       = $True;
            ShowPeoplePickerSuggestionsForGuestUsers   = $False;
        }
        SPOTenantCdnEnabled "SPOTenantCdnEnabled-Public"
        {
            CdnType              = "Public";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnEnabled "SPOTenantCdnEnabled-Private"
        {
            CdnType              = "Private";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnPolicy "SPOTenantCdnPolicy-Public"
        {
            CDNType                              = "Public";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantCdnPolicy "SPOTenantCdnPolicy-Private"
        {
            CDNType                              = "Private";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantSettings "SPOTenantSettings"
        {
            ApplyAppEnforcedRestrictionsToAdHocRecipients = $True;
            CommentsOnSitePagesDisabled                   = $False;
            ConditionalAccessPolicy                       = "AllowFullAccess";
            Credential                                    = $Credscredential;
            Ensure                                        = "Present";
            FilePickerExternalImageSearchEnabled          = $True;
            HideDefaultThemes                             = $False;
            IsSingleInstance                              = "Yes";
            LegacyAuthProtocolsEnabled                    = $True;
            MarkNewFilesSensitiveByDefault                = "AllowExternalSharing";
            MaxCompatibilityLevel                         = "15";
            MinCompatibilityLevel                         = "15";
            NotificationsInSharePointEnabled              = $True;
            OfficeClientADALDisabled                      = $False;
            OwnerAnonymousNotification                    = $True;
            PublicCdnAllowedFileTypes                     = "CSS,EOT,GIF,ICO,JPEG,JPG,JS,MAP,PNG,SVG,TTF,WOFF";
            PublicCdnEnabled                              = $False;
            SearchResolveExactEmailOrUPN                  = $False;
            SignInAccelerationDomain                      = "";
            UseFindPeopleInPeoplePicker                   = $False;
            UsePersistentCookiesForExplorerView           = $False;
            UserVoiceForFeedbackEnabled                   = $True;
        }
        TeamsAppPermissionPolicy "TeamsAppPermissionPolicy-Global"
        {
            Credential             = $Credscredential;
            DefaultCatalogApps     = @();
            DefaultCatalogAppsType = "BlockedAppList";
            Ensure                 = "Present";
            GlobalCatalogApps      = @();
            GlobalCatalogAppsType  = "BlockedAppList";
            Identity               = "Global";
            PrivateCatalogApps     = @();
            PrivateCatalogAppsType = "BlockedAppList";
        }
        TeamsAppSetupPolicy "TeamsAppSetupPolicy-Global"
        {
            AllowSideLoading     = $False;
            AllowUserPinning     = $True;
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
            PinnedAppBarApps     = @("14d6962d-6eeb-4f48-8890-de55454bb136","86fcd49b-61a2-4701-b771-54728cd291fb","2a84919f-59d8-4441-a975-2a8c2643b741","ef56c0de-36fc-4ef8-b417-3d82ba9d073c","20c3440d-c67e-4420-9f80-0e50c39693df","5af6a76b-40fc-4ba1-af29-8f49b08e44fd");
        }
        TeamsAppSetupPolicy "TeamsAppSetupPolicy-FirstLineWorker"
        {
            AllowSideLoading     = $False;
            AllowUserPinning     = $True;
            Credential           = $Credscredential;
            Description          = "This is a default app setup policy for Firstline workers. This policy cannot be customized.";
            Ensure               = "Present";
            Identity             = "FirstLineWorker";
            PinnedAppBarApps     = @("14d6962d-6eeb-4f48-8890-de55454bb136","42f6c1da-a241-483a-a3cc-4f5be9185951","86fcd49b-61a2-4701-b771-54728cd291fb","20c3440d-c67e-4420-9f80-0e50c39693df");
        }
        TeamsAudioConferencingPolicy "TeamsAudioConferencingPolicy-Global"
        {
            AllowTollFreeDialin       = $True;
            Credential                = $Credscredential;
            Ensure                    = "Present";
            Identity                  = "Global";
            MeetingInvitePhoneNumbers = @();
        }
        TeamsCallHoldPolicy "TeamsCallHoldPolicy-Global"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
        }
        TeamsCallingPolicy "TeamsCallingPolicy-Global"
        {
            AllowCallForwardingToPhone        = $True;
            AllowCallForwardingToUser         = $True;
            AllowCallGroups                   = $True;
            AllowCallRedirect                 = "Disabled";
            AllowCloudRecordingForCalls       = $False;
            AllowDelegation                   = $True;
            AllowPrivateCalling               = $True;
            AllowSIPDevicesCalling            = $False;
            AllowTranscriptionForCalling      = $False;
            AllowVoicemail                    = "UserOverride";
            AllowWebPSTNCalling               = $True;
            AutoAnswerEnabledType             = "Disabled";
            BusyOnBusyEnabledType             = "Disabled";
            CallRecordingExpirationDays       = 60;
            Credential                        = $Credscredential;
            Ensure                            = "Present";
            Identity                          = "Global";
            LiveCaptionsEnabledTypeForCalling = "DisabledUserOverride";
            MusicOnHoldEnabledType            = "Enabled";
            PreventTollBypass                 = $False;
            SpamFilteringEnabledType          = "Enabled";
        }
        TeamsCallingPolicy "TeamsCallingPolicy-Tag:AllowCalling"
        {
            AllowCallForwardingToPhone        = $True;
            AllowCallForwardingToUser         = $True;
            AllowCallGroups                   = $True;
            AllowCallRedirect                 = "Disabled";
            AllowCloudRecordingForCalls       = $False;
            AllowDelegation                   = $True;
            AllowPrivateCalling               = $True;
            AllowSIPDevicesCalling            = $False;
            AllowTranscriptionForCalling      = $False;
            AllowVoicemail                    = "UserOverride";
            AllowWebPSTNCalling               = $True;
            AutoAnswerEnabledType             = "Disabled";
            BusyOnBusyEnabledType             = "Disabled";
            CallRecordingExpirationDays       = 60;
            Credential                        = $Credscredential;
            Ensure                            = "Present";
            Identity                          = "Tag:AllowCalling";
            LiveCaptionsEnabledTypeForCalling = "DisabledUserOverride";
            MusicOnHoldEnabledType            = "Enabled";
            PreventTollBypass                 = $False;
            SpamFilteringEnabledType          = "Enabled";
        }
        TeamsCallingPolicy "TeamsCallingPolicy-Tag:DisallowCalling"
        {
            AllowCallForwardingToPhone        = $False;
            AllowCallForwardingToUser         = $False;
            AllowCallGroups                   = $False;
            AllowCallRedirect                 = "Disabled";
            AllowCloudRecordingForCalls       = $False;
            AllowDelegation                   = $False;
            AllowPrivateCalling               = $False;
            AllowSIPDevicesCalling            = $False;
            AllowTranscriptionForCalling      = $False;
            AllowVoicemail                    = "AlwaysDisabled";
            AllowWebPSTNCalling               = $True;
            AutoAnswerEnabledType             = "Disabled";
            BusyOnBusyEnabledType             = "Disabled";
            CallRecordingExpirationDays       = 60;
            Credential                        = $Credscredential;
            Ensure                            = "Present";
            Identity                          = "Tag:DisallowCalling";
            LiveCaptionsEnabledTypeForCalling = "DisabledUserOverride";
            MusicOnHoldEnabledType            = "Enabled";
            PreventTollBypass                 = $False;
            SpamFilteringEnabledType          = "Enabled";
        }
        TeamsCallingPolicy "TeamsCallingPolicy-Tag:AllowCallingPreventTollBypass"
        {
            AllowCallForwardingToPhone        = $True;
            AllowCallForwardingToUser         = $True;
            AllowCallGroups                   = $True;
            AllowCallRedirect                 = "Disabled";
            AllowCloudRecordingForCalls       = $False;
            AllowDelegation                   = $True;
            AllowPrivateCalling               = $True;
            AllowSIPDevicesCalling            = $False;
            AllowTranscriptionForCalling      = $False;
            AllowVoicemail                    = "UserOverride";
            AllowWebPSTNCalling               = $True;
            AutoAnswerEnabledType             = "Disabled";
            BusyOnBusyEnabledType             = "Disabled";
            CallRecordingExpirationDays       = 60;
            Credential                        = $Credscredential;
            Ensure                            = "Present";
            Identity                          = "Tag:AllowCallingPreventTollBypass";
            LiveCaptionsEnabledTypeForCalling = "DisabledUserOverride";
            MusicOnHoldEnabledType            = "Enabled";
            PreventTollBypass                 = $True;
            SpamFilteringEnabledType          = "Enabled";
        }
        TeamsCallingPolicy "TeamsCallingPolicy-Tag:AllowCallingPreventForwardingtoPhone"
        {
            AllowCallForwardingToPhone        = $False;
            AllowCallForwardingToUser         = $True;
            AllowCallGroups                   = $True;
            AllowCallRedirect                 = "Disabled";
            AllowCloudRecordingForCalls       = $False;
            AllowDelegation                   = $True;
            AllowPrivateCalling               = $True;
            AllowSIPDevicesCalling            = $False;
            AllowTranscriptionForCalling      = $False;
            AllowVoicemail                    = "UserOverride";
            AllowWebPSTNCalling               = $True;
            AutoAnswerEnabledType             = "Disabled";
            BusyOnBusyEnabledType             = "Disabled";
            CallRecordingExpirationDays       = 60;
            Credential                        = $Credscredential;
            Ensure                            = "Present";
            Identity                          = "Tag:AllowCallingPreventForwardingtoPhone";
            LiveCaptionsEnabledTypeForCalling = "DisabledUserOverride";
            MusicOnHoldEnabledType            = "Enabled";
            PreventTollBypass                 = $False;
            SpamFilteringEnabledType          = "Enabled";
        }
        TeamsCallParkPolicy "TeamsCallParkPolicy-Global"
        {
            AllowCallPark        = $False;
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
            ParkTimeoutSeconds   = 300;
            PickupRangeEnd       = 99;
            PickupRangeStart     = 10;
        }
        TeamsChannelsPolicy "TeamsChannelsPolicy-Global"
        {
            AllowChannelSharingToExternalUser             = $True;
            AllowOrgWideTeamCreation                      = $True;
            AllowPrivateChannelCreation                   = $True;
            AllowSharedChannelCreation                    = $True;
            AllowUserToParticipateInExternalSharedChannel = $True;
            Credential                                    = $Credscredential;
            EnablePrivateTeamDiscovery                    = $False;
            Ensure                                        = "Present";
            Identity                                      = "Global";
        }
        TeamsChannelsPolicy "TeamsChannelsPolicy-Tag:Default"
        {
            AllowChannelSharingToExternalUser             = $True;
            AllowOrgWideTeamCreation                      = $True;
            AllowPrivateChannelCreation                   = $True;
            AllowSharedChannelCreation                    = $True;
            AllowUserToParticipateInExternalSharedChannel = $True;
            Credential                                    = $Credscredential;
            EnablePrivateTeamDiscovery                    = $False;
            Ensure                                        = "Present";
            Identity                                      = "Tag:Default";
        }
        TeamsClientConfiguration "TeamsClientConfiguration-Global"
        {
            AllowBox                         = $True;
            AllowDropBox                     = $True;
            AllowEgnyte                      = $True;
            AllowEmailIntoChannel            = $True;
            AllowGoogleDrive                 = $True;
            AllowGuestUser                   = $True;
            AllowOrganizationTab             = $True;
            AllowResourceAccountSendMessage  = $True;
            AllowScopedPeopleSearchandAccess = $False;
            AllowShareFile                   = $True;
            AllowSkypeBusinessInterop        = $True;
            ContentPin                       = "RequiredOutsideScheduleMeeting";
            Credential                       = $Credscredential;
            Identity                         = "Global";
            ResourceAccountContentAccess     = "NoAccess";
        }
        TeamsComplianceRecordingPolicy "TeamsComplianceRecordingPolicy-Global"
        {
            ComplianceRecordingApplications                     = @();
            Credential                                          = $Credscredential;
            DisableComplianceRecordingAudioNotificationForCalls = $False;
            Enabled                                             = $False;
            Ensure                                              = "Present";
            Identity                                            = "Global";
            WarnUserOnRemoval                                   = $True;
        }
        TeamsCortanaPolicy "TeamsCortanaPolicy-Global"
        {
            CortanaVoiceInvocationMode = "WakeWordPushToTalkUserOverride";
            Credential                 = $Credscredential;
            Ensure                     = "Present";
            Identity                   = "Global";
        }
        TeamsDialInConferencingTenantSettings "TeamsDialInConferencingTenantSettings"
        {
            AllowPSTNOnlyMeetingsByDefault   = $False;
            AutomaticallyMigrateUserMeetings = $True;
            AutomaticallyReplaceAcpProvider  = $False;
            AutomaticallySendEmailsToUsers   = $True;
            Credential                       = $Credscredential;
            EnableDialOutJoinConfirmation    = $False;
            EnableEntryExitNotifications     = $True;
            EntryExitAnnouncementsType       = "ToneOnly";
            IsSingleInstance                 = "Yes";
            MaskPstnNumbersType              = "MaskedForExternalUsers";
            PinLength                        = 5;
        }
        TeamsEmergencyCallingPolicy "TeamsEmergencyCallingPolicy-Global"
        {
            Credential                 = $Credscredential;
            Ensure                     = "Present";
            ExternalLocationLookupMode = "Disabled";
            Identity                   = "Global";
        }
        TeamsEmergencyCallRoutingPolicy "TeamsEmergencyCallRoutingPolicy-Global"
        {
            AllowEnhancedEmergencyServices = $False;
            Credential                     = $Credscredential;
            Ensure                         = "Present";
            Identity                       = "Global";
        }
        TeamsEnhancedEncryptionPolicy "TeamsEnhancedEncryptionPolicy-Global"
        {
            CallingEndtoEndEncryptionEnabledType = "Disabled";
            Credential                           = $Credscredential;
            Ensure                               = "Present";
            Identity                             = "Global";
            MeetingEndToEndEncryption            = "DisabledUserOverride";
        }
        TeamsEnhancedEncryptionPolicy "TeamsEnhancedEncryptionPolicy-Tag:Disabled"
        {
            CallingEndtoEndEncryptionEnabledType = "Disabled";
            Credential                           = $Credscredential;
            Ensure                               = "Present";
            Identity                             = "Tag:Disabled";
            MeetingEndToEndEncryption            = "Disabled";
        }
        TeamsEnhancedEncryptionPolicy "TeamsEnhancedEncryptionPolicy-Tag:UserControlled"
        {
            CallingEndtoEndEncryptionEnabledType = "DisabledUserOverride";
            Credential                           = $Credscredential;
            Ensure                               = "Present";
            Identity                             = "Tag:UserControlled";
            MeetingEndToEndEncryption            = "DisabledUserOverride";
        }
        TeamsEventsPolicy "TeamsEventsPolicy-Global"
        {
            AllowWebinars        = "Enabled";
            Credential           = $Credscredential;
            Description          = "Default policy";
            Ensure               = "Present";
            EventAccessType      = "Everyone";
            Identity             = "Global";
        }
        TeamsFederationConfiguration "TeamsFederationConfiguration-Global"
        {
            AllowedDomains                              = @();
            AllowFederatedUsers                         = $True;
            AllowPublicUsers                            = $True;
            AllowTeamsConsumer                          = $True;
            AllowTeamsConsumerInbound                   = $True;
            BlockedDomains                              = @();
            Credential                                  = $Credscredential;
            Identity                                    = "Global";
            RestrictTeamsConsumerToExternalUserProfiles = $False;
            SharedSipAddressSpace                       = $False;
            TreatDiscoveredPartnersAsUnverified         = $False;
        }
        TeamsFeedbackPolicy "TeamsFeedbackPolicy-Global"
        {
            AllowEmailCollection      = $False;
            AllowLogCollection        = $False;
            AllowScreenshotCollection = $False;
            Credential                = $Credscredential;
            Ensure                    = "Present";
            Identity                  = "Global";
            ReceiveSurveysMode        = "EnabledUserOverride";
            UserInitiatedMode         = "Enabled";
        }
        TeamsFeedbackPolicy "TeamsFeedbackPolicy-Tag:UserChoice"
        {
            AllowEmailCollection      = $False;
            AllowLogCollection        = $False;
            AllowScreenshotCollection = $False;
            Credential                = $Credscredential;
            Ensure                    = "Present";
            Identity                  = "Tag:UserChoice";
            ReceiveSurveysMode        = "EnabledUserOverride";
            UserInitiatedMode         = "Enabled";
        }
        TeamsFeedbackPolicy "TeamsFeedbackPolicy-Tag:Enabled"
        {
            AllowEmailCollection      = $False;
            AllowLogCollection        = $False;
            AllowScreenshotCollection = $False;
            Credential                = $Credscredential;
            Ensure                    = "Present";
            Identity                  = "Tag:Enabled";
            ReceiveSurveysMode        = "Enabled";
            UserInitiatedMode         = "Enabled";
        }
        TeamsFeedbackPolicy "TeamsFeedbackPolicy-Tag:Disabled"
        {
            AllowEmailCollection      = $False;
            AllowLogCollection        = $False;
            AllowScreenshotCollection = $False;
            Credential                = $Credscredential;
            Ensure                    = "Present";
            Identity                  = "Tag:Disabled";
            ReceiveSurveysMode        = "Disabled";
            UserInitiatedMode         = "Disabled";
        }
        TeamsFilesPolicy "TeamsFilesPolicy-Global"
        {
            Credential            = $Credscredential;
            Ensure                = "Present";
            Identity              = "Global";
            NativeFileEntryPoints = "Enabled";
            SPChannelFilesTab     = "Enabled";
        }
        TeamsGuestCallingConfiguration "TeamsGuestCallingConfiguration-Global"
        {
            AllowPrivateCalling  = $True;
            Credential           = $Credscredential;
            Identity             = "Global";
        }
        TeamsGuestMeetingConfiguration "TeamsGuestMeetingConfiguration-Global"
        {
            AllowIPVideo            = $True;
            AllowMeetNow            = $True;
            Credential              = $Credscredential;
            Identity                = "Global";
            LiveCaptionsEnabledType = "DisabledUserOverride";
            ScreenSharingMode       = "EntireScreen";
        }
        TeamsGuestMessagingConfiguration "TeamsGuestMessagingConfiguration-Global"
        {
            AllowGiphy             = $True;
            AllowImmersiveReader   = $True;
            AllowMemes             = $True;
            AllowStickers          = $True;
            AllowUserChat          = $True;
            AllowUserDeleteChat    = $True;
            AllowUserDeleteMessage = $True;
            AllowUserEditMessage   = $True;
            Credential             = $Credscredential;
            GiphyRatingType        = "Moderate";
            Identity               = "Global";
        }
        TeamsIPPhonePolicy "TeamsIPPhonePolicy-Global"
        {
            AllowBetterTogether            = "Enabled";
            AllowHomeScreen                = "EnabledUserOverride";
            AllowHotDesking                = $True;
            Credential                     = $Credscredential;
            Ensure                         = "Present";
            HotDeskingIdleTimeoutInMinutes = 120;
            Identity                       = "Global";
            SearchOnCommonAreaPhoneMode    = "Enabled";
            SignInMode                     = "UserSignIn";
        }
        TeamsMeetingBroadcastConfiguration "TeamsMeetingBroadcastConfiguration-Global"
        {
            AllowSdnProviderForBroadcastMeeting = $False;
            Credential                          = $Credscredential;
            Identity                            = "Global";
            SdnApiTemplateUrl                   = "";
            SdnApiToken                         = $ConfigurationData.Settings.SdnApiToken;
            SdnLicenseId                        = "";
            SdnProviderName                     = "";
            SupportURL                          = "https://support.office.com/home/contact";
        }
        TeamsMeetingBroadcastPolicy "TeamsMeetingBroadcastPolicy-Global"
        {
            AllowBroadcastScheduling        = $True;
            AllowBroadcastTranscription     = $False;
            BroadcastAttendeeVisibilityMode = "EveryoneInCompany";
            BroadcastRecordingMode          = "AlwaysEnabled";
            Credential                      = $Credscredential;
            Ensure                          = "Present";
            Identity                        = "Global";
        }
        TeamsMeetingBroadcastPolicy "TeamsMeetingBroadcastPolicy-Tag:Default"
        {
            AllowBroadcastScheduling        = $True;
            AllowBroadcastTranscription     = $False;
            BroadcastAttendeeVisibilityMode = "EveryoneInCompany";
            BroadcastRecordingMode          = "AlwaysEnabled";
            Credential                      = $Credscredential;
            Ensure                          = "Present";
            Identity                        = "Tag:Default";
        }
        TeamsMeetingConfiguration "TeamsMeetingConfiguration-Global"
        {
            ClientAppSharingPort        = 50040;
            ClientAppSharingPortRange   = 20;
            ClientAudioPort             = 50000;
            ClientAudioPortRange        = 20;
            ClientMediaPortRangeEnabled = $True;
            ClientVideoPort             = 50020;
            ClientVideoPortRange        = 20;
            Credential                  = $Credscredential;
            CustomFooterText            = "";
            DisableAnonymousJoin        = $False;
            EnableQoS                   = $False;
            Identity                    = "Global";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Global"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $True;
            AllowCloudRecording                        = $True;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $True;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $True;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $True;
            AllowWatermarkForScreenSharing             = $True;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Global";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "DisabledUserOverride";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:AllOn"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $True;
            AllowCloudRecording                        = $True;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $True;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $True;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            Description                                = "Do not assign. This policy is same as global defaults and would be deprecated";
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:AllOn";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "DisabledUserOverride";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:RestrictedAnonymousAccess"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $True;
            AllowCloudRecording                        = $True;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $True;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $True;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            Description                                = "Do not assign. This policy is same as global defaults and would be deprecated";
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:RestrictedAnonymousAccess";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "Disabled";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:AllOff"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $False;
            AllowCloudRecording                        = $False;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $False;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $False;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $False;
            AllowParticipantGiveRequestControl         = $False;
            AllowPowerPointSharing                     = $False;
            AllowPrivateMeetingScheduling              = $False;
            AllowPrivateMeetNow                        = $False;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $False;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $False;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:AllOff";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "Disabled";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Disabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "Disabled";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:RestrictedAnonymousNoRecording"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $True;
            AllowCloudRecording                        = $False;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $True;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $True;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            Description                                = "Do not assign. This policy is similar to global defaults and would be deprecated";
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:RestrictedAnonymousNoRecording";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "Disabled";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:Default"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $True;
            AllowCloudRecording                        = $True;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $True;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $True;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:Default";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "DisabledUserOverride";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMeetingPolicy "TeamsMeetingPolicy-Tag:Kiosk"
        {
            AllowAnnotations                           = $True;
            AllowAnonymousUsersToDialOut               = $False;
            AllowAnonymousUsersToJoinMeeting           = $True;
            AllowAnonymousUsersToStartMeeting          = $False;
            AllowBreakoutRooms                         = $True;
            AllowCartCaptionsScheduling                = "DisabledUserOverride";
            AllowChannelMeetingScheduling              = $False;
            AllowCloudRecording                        = $False;
            AllowDocumentCollaboration                 = "Enabled";
            AllowEngagementReport                      = "Enabled";
            AllowExternalParticipantGiveRequestControl = $False;
            AllowIPAudio                               = $True;
            AllowIPVideo                               = $True;
            AllowMeetingCoach                          = $True;
            AllowMeetingReactions                      = $True;
            AllowMeetingRegistration                   = $True;
            AllowMeetNow                               = $True;
            AllowNDIStreaming                          = $False;
            AllowNetworkConfigurationSettingsLookup    = $False;
            AllowOrganizersToOverrideLobbySettings     = $False;
            AllowOutlookAddIn                          = $False;
            AllowParticipantGiveRequestControl         = $True;
            AllowPowerPointSharing                     = $True;
            AllowPrivateMeetingScheduling              = $False;
            AllowPrivateMeetNow                        = $True;
            AllowPSTNUsersToBypassLobby                = $False;
            AllowRecordingStorageOutsideRegion         = $False;
            AllowSharedNotes                           = $True;
            AllowTranscription                         = $False;
            AllowWatermarkForCameraVideo               = $False;
            AllowWatermarkForScreenSharing             = $False;
            AllowWhiteboard                            = $True;
            AutoAdmittedUsers                          = "EveryoneInCompany";
            ChannelRecordingDownload                   = "Allow";
            Credential                                 = $Credscredential;
            DesignatedPresenterRoleMode                = "EveryoneUserOverride";
            EnrollUserOverride                         = "Disabled";
            Ensure                                     = "Present";
            ExplicitRecordingConsent                   = "Disabled";
            Identity                                   = "Tag:Kiosk";
            InfoShownInReportMode                      = "FullInformation";
            IPAudioMode                                = "EnabledOutgoingIncoming";
            IPVideoMode                                = "EnabledOutgoingIncoming";
            LiveCaptionsEnabledType                    = "Disabled";
            LiveInterpretationEnabledType              = "DisabledUserOverride";
            LiveStreamingMode                          = "Disabled";
            MediaBitRateKb                             = 50000;
            MeetingChatEnabledType                     = "Enabled";
            NewMeetingRecordingExpirationDays          = 120;
            PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb";
            QnAEngagementMode                          = "Enabled";
            RoomPeopleNameUserOverride                 = "Off";
            ScreenSharingMode                          = "EntireScreen";
            SpeakerAttributionMode                     = "EnabledUserOverride";
            StreamingAttendeeMode                      = "Disabled";
            TeamsCameraFarEndPTZMode                   = "Disabled";
            VideoFiltersMode                           = "AllFilters";
            WhoCanRegister                             = "Everyone";
        }
        TeamsMessagingPolicy "TeamsMessagingPolicy-Global"
        {
            AllowGiphy                    = $True;
            AllowImmersiveReader          = $True;
            AllowMemes                    = $True;
            AllowOwnerDeleteMessage       = $False;
            AllowPriorityMessages         = $True;
            AllowRemoveUser               = $True;
            AllowSmartCompose             = $True;
            AllowSmartReply               = $True;
            AllowStickers                 = $True;
            AllowUrlPreviews              = $True;
            AllowUserChat                 = $True;
            AllowUserDeleteChat           = $True;
            AllowUserDeleteMessage        = $True;
            AllowUserEditMessage          = $True;
            AllowUserTranslation          = $True;
            AudioMessageEnabledType       = "ChatsAndChannels";
            ChannelsInChatListEnabledType = "DisabledUserOverride";
            Credential                    = $Credscredential;
            Ensure                        = "Present";
            GiphyRatingType               = "Moderate";
            Identity                      = "Global";
            ReadReceiptsEnabledType       = "UserPreference";
        }
        TeamsMessagingPolicy "TeamsMessagingPolicy-Default"
        {
            AllowGiphy                    = $True;
            AllowImmersiveReader          = $True;
            AllowMemes                    = $True;
            AllowOwnerDeleteMessage       = $False;
            AllowPriorityMessages         = $True;
            AllowRemoveUser               = $True;
            AllowSmartCompose             = $True;
            AllowSmartReply               = $True;
            AllowStickers                 = $True;
            AllowUrlPreviews              = $True;
            AllowUserChat                 = $True;
            AllowUserDeleteChat           = $True;
            AllowUserDeleteMessage        = $True;
            AllowUserEditMessage          = $True;
            AllowUserTranslation          = $True;
            AudioMessageEnabledType       = "ChatsAndChannels";
            ChannelsInChatListEnabledType = "DisabledUserOverride";
            Credential                    = $Credscredential;
            Ensure                        = "Present";
            GiphyRatingType               = "Moderate";
            Identity                      = "Default";
            ReadReceiptsEnabledType       = "UserPreference";
        }
        TeamsMessagingPolicy "TeamsMessagingPolicy-EduFaculty"
        {
            AllowGiphy                    = $False;
            AllowImmersiveReader          = $True;
            AllowMemes                    = $True;
            AllowOwnerDeleteMessage       = $True;
            AllowPriorityMessages         = $True;
            AllowRemoveUser               = $True;
            AllowSmartCompose             = $True;
            AllowSmartReply               = $True;
            AllowStickers                 = $True;
            AllowUrlPreviews              = $True;
            AllowUserChat                 = $True;
            AllowUserDeleteChat           = $True;
            AllowUserDeleteMessage        = $True;
            AllowUserEditMessage          = $True;
            AllowUserTranslation          = $True;
            AudioMessageEnabledType       = "ChatsAndChannels";
            ChannelsInChatListEnabledType = "DisabledUserOverride";
            Credential                    = $Credscredential;
            Ensure                        = "Present";
            GiphyRatingType               = "Strict";
            Identity                      = "EduFaculty";
            ReadReceiptsEnabledType       = "UserPreference";
        }
        TeamsMessagingPolicy "TeamsMessagingPolicy-EduStudent"
        {
            AllowGiphy                    = $False;
            AllowImmersiveReader          = $True;
            AllowMemes                    = $True;
            AllowOwnerDeleteMessage       = $False;
            AllowPriorityMessages         = $True;
            AllowRemoveUser               = $True;
            AllowSmartCompose             = $True;
            AllowSmartReply               = $True;
            AllowStickers                 = $True;
            AllowUrlPreviews              = $True;
            AllowUserChat                 = $True;
            AllowUserDeleteChat           = $True;
            AllowUserDeleteMessage        = $True;
            AllowUserEditMessage          = $True;
            AllowUserTranslation          = $True;
            AudioMessageEnabledType       = "ChatsAndChannels";
            ChannelsInChatListEnabledType = "DisabledUserOverride";
            Credential                    = $Credscredential;
            Ensure                        = "Present";
            GiphyRatingType               = "Strict";
            Identity                      = "EduStudent";
            ReadReceiptsEnabledType       = "UserPreference";
        }
        TeamsMobilityPolicy "TeamsMobilityPolicy-Global"
        {
            Credential             = $Credscredential;
            Ensure                 = "Present";
            Identity               = "Global";
            IPAudioMobileMode      = "AllNetworks";
            IPVideoMobileMode      = "AllNetworks";
            MobileDialerPreference = "Teams";
        }
        TeamsMobilityPolicy "TeamsMobilityPolicy-Tag:Default"
        {
            Credential             = $Credscredential;
            Ensure                 = "Present";
            Identity               = "Tag:Default";
            IPAudioMobileMode      = "AllNetworks";
            IPVideoMobileMode      = "AllNetworks";
            MobileDialerPreference = "Teams";
        }
        TeamsNetworkRoamingPolicy "TeamsNetworkRoamingPolicy-Global"
        {
            AllowIPVideo         = $True;
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
            MediaBitRateKb       = 50000;
        }
        TeamsOnlineVoicemailPolicy "TeamsOnlineVoicemailPolicy-Global"
        {
            Credential                          = $Credscredential;
            EnableEditingCallAnswerRulesSetting = $True;
            EnableTranscription                 = $True;
            EnableTranscriptionProfanityMasking = $False;
            EnableTranscriptionTranslation      = $True;
            Ensure                              = "Present";
            Identity                            = "Global";
            MaximumRecordingLength              = "00:05:00";
            ShareData                           = "Defer";
        }
        TeamsOnlineVoicemailPolicy "TeamsOnlineVoicemailPolicy-Default"
        {
            Credential                          = $Credscredential;
            EnableEditingCallAnswerRulesSetting = $True;
            EnableTranscription                 = $True;
            EnableTranscriptionProfanityMasking = $False;
            EnableTranscriptionTranslation      = $True;
            Ensure                              = "Present";
            Identity                            = "Default";
            MaximumRecordingLength              = "00:05:00";
            ShareData                           = "Defer";
        }
        TeamsOnlineVoicemailPolicy "TeamsOnlineVoicemailPolicy-TranscriptionDisabled"
        {
            Credential                          = $Credscredential;
            EnableEditingCallAnswerRulesSetting = $True;
            EnableTranscription                 = $False;
            EnableTranscriptionProfanityMasking = $False;
            EnableTranscriptionTranslation      = $True;
            Ensure                              = "Present";
            Identity                            = "TranscriptionDisabled";
            MaximumRecordingLength              = "00:05:00";
            ShareData                           = "Defer";
        }
        TeamsOnlineVoicemailPolicy "TeamsOnlineVoicemailPolicy-TranscriptionProfanityMaskingEnabled"
        {
            Credential                          = $Credscredential;
            EnableEditingCallAnswerRulesSetting = $True;
            EnableTranscription                 = $True;
            EnableTranscriptionProfanityMasking = $True;
            EnableTranscriptionTranslation      = $True;
            Ensure                              = "Present";
            Identity                            = "TranscriptionProfanityMaskingEnabled";
            MaximumRecordingLength              = "00:05:00";
            ShareData                           = "Defer";
        }
        TeamsOnlineVoiceUser "TeamsOnlineVoiceUser-MCTESTY@EsdecSolarGroupTest.onmicrosoft.com"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "MCTESTY@$OrganizationName";
        }
        TeamsOrgWideAppSettings "TeamsOrgWideAppSettings"
        {
            Credential                         = $Credscredential;
            IsSideloadedAppsInteractionEnabled = $True;
            IsSingleInstance                   = "Yes";
        }
        TeamsShiftsPolicy "TeamsShiftsPolicy-Global"
        {
            AccessGracePeriodMinutes       = 15;
            AccessType                     = "UnrestrictedAccess_TeamsApp";
            Credential                     = $Credscredential;
            EnableScheduleOwnerPermissions = $False;
            Ensure                         = "Present";
            Identity                       = "Global";
            ShiftNoticeFrequency           = "Never";
            ShiftNoticeMessageCustom       = "";
            ShiftNoticeMessageType         = "DefaultMessage";
        }
        TeamsShiftsPolicy "TeamsShiftsPolicy-Tag:Default"
        {
            AccessGracePeriodMinutes       = 15;
            AccessType                     = "UnrestrictedAccess_TeamsApp";
            Credential                     = $Credscredential;
            EnableScheduleOwnerPermissions = $False;
            Ensure                         = "Present";
            Identity                       = "Tag:Default";
            ShiftNoticeFrequency           = "Never";
            ShiftNoticeMessageCustom       = "";
            ShiftNoticeMessageType         = "DefaultMessage";
        }
        TeamsTemplatesPolicy "TeamsTemplatesPolicy-Global"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            HiddenTemplates      = @();
            Identity             = "Global";
        }
        TeamsTenantDialPlan "TeamsTenantDialPlan-Global"
        {
            Credential            = $Credscredential;
            Ensure                = "Present";
            Identity              = "Global";
            NormalizationRules    = @();
            OptimizeDeviceDialing = $False;
            SimpleName            = "DefaultTenantDialPlan";
        }
        TeamsUpdateManagementPolicy "TeamsUpdateManagementPolicy-Global"
        {
            AllowManagedUpdates  = $False;
            AllowPreview         = $False;
            AllowPublicPreview   = "FollowOfficePreview";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
            UpdateDayOfWeek      = 1;
            UpdateTime           = "18:00";
            UpdateTimeOfDay      = "18:00";
            UseNewTeamsClient    = "MicrosoftChoice";
        }
        TeamsUpdateManagementPolicy "TeamsUpdateManagementPolicy-Tag:Default"
        {
            AllowManagedUpdates  = $False;
            AllowPreview         = $False;
            AllowPublicPreview   = "FollowOfficePreview";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Tag:Default";
            UpdateDayOfWeek      = 1;
            UpdateTime           = "18:00";
            UpdateTimeOfDay      = "18:00";
            UseNewTeamsClient    = "MicrosoftChoice";
        }
        TeamsUpgradeConfiguration "TeamsUpgradeConfiguration"
        {
            Credential           = $Credscredential;
            DownloadTeams        = $True;
            IsSingleInstance     = "Yes";
            SfBMeetingJoinUx     = "NativeLimitedClient";
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-Global"
        {
            Credential             = $Credscredential;
            Identity               = "Global";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-UpgradeToTeams"
        {
            Credential             = $Credscredential;
            Identity               = "UpgradeToTeams";
            MigrateMeetingsToTeams = $False;
            Users                  = @("MCTESTY@$OrganizationName");
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-Islands"
        {
            Credential             = $Credscredential;
            Identity               = "Islands";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-IslandsWithNotify"
        {
            Credential             = $Credscredential;
            Identity               = "IslandsWithNotify";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBOnly"
        {
            Credential             = $Credscredential;
            Identity               = "SfBOnly";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBOnlyWithNotify"
        {
            Credential             = $Credscredential;
            Identity               = "SfBOnlyWithNotify";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBWithTeamsCollab"
        {
            Credential             = $Credscredential;
            Identity               = "SfBWithTeamsCollab";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBWithTeamsCollabWithNotify"
        {
            Credential             = $Credscredential;
            Identity               = "SfBWithTeamsCollabWithNotify";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBWithTeamsCollabAndMeetings"
        {
            Credential             = $Credscredential;
            Identity               = "SfBWithTeamsCollabAndMeetings";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBWithTeamsCollabAndMeetingsWithNotify"
        {
            Credential             = $Credscredential;
            Identity               = "SfBWithTeamsCollabAndMeetingsWithNotify";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsUpgradePolicy "TeamsUpgradePolicy-SfBOnlyWithOutNotify"
        {
            Credential             = $Credscredential;
            Identity               = "SfBOnlyWithOutNotify";
            MigrateMeetingsToTeams = $False;
            Users                  = @();
        }
        TeamsVdiPolicy "TeamsVdiPolicy-Global"
        {
            Credential                          = $Credscredential;
            DisableAudioVideoInCallsAndMeetings = $False;
            DisableCallsAndMeetings             = $False;
            Ensure                              = "Present";
            Identity                            = "Global";
        }
        TeamsVoiceRoute "TeamsVoiceRoute-LocalRoute"
        {
            Credential            = $Credscredential;
            Ensure                = "Present";
            Identity              = "LocalRoute";
            NumberPattern         = "^(\+1[0-9]{10})$";
            OnlinePstnGatewayList = @();
            OnlinePstnUsages      = @();
            Priority              = 0;
        }
        TeamsVoiceRoutingPolicy "TeamsVoiceRoutingPolicy-Global"
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
            OnlinePstnUsages     = @();
        }
        TeamsWorkloadPolicy "TeamsWorkloadPolicy-Global"
        {
            AllowCalling         = $True;
            AllowCallingPinned   = $True;
            AllowMeeting         = $True;
            AllowMeetingPinned   = $True;
            AllowMessaging       = $True;
            AllowMessagingPinned = $True;
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Global";
        }
    }
}

M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
