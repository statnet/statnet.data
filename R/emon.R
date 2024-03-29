#' Interorganizational Search and Rescue Networks (Drabek et al.)
#'
#' Drabek et al. (1981) provide seven case studies of emergent
#' multi-organizational networks (EMONs) in the context of search and rescue
#' (SAR) activities.  Networks of interaction frequency are reported, along with
#' several organizational attributes.
#'
#' @docType data
#'
#' @format A list of 7 [network][network::network] objects:
#'
#' ```{r, echo=FALSE}
#' md_table(
#'   data.frame(
#'     Name = c("`Cheyenne`", "`HurrFrederic`", "`LakePomona`", "`MtSi`",
#'       "`MtStHelens`", "`Texas`", "`Wichita`"),
#'     Description = c(
#'       "Cheyenne SAR EMON",
#'       "Hurricane Frederic SAR EMON",
#'       "Lake Pomona SAR EMON",
#'       "Mt. Si SAR EMON",
#'       "Mt. St. Helens SAR EMON",
#'       "Texas Hill Country SAR EMON",
#'       "Wichita Falls SAR EMON"
#'     )
#'   )
#' )
#' ```
#'
#' Each network has one edge attribute:
#'
#' ```{r, echo=FALSE}
#' md_table(data.frame(
#'   Name = md_code("Frequency"),
#'   Class = "numeric",
#'   Description = "Interaction frequency (1-4; 1=most frequent)"
#' ))
#' ```
#'
#' Each network also has 8 vertex attributes:
#'
#'  \tabular{lll}{
#'   Command.Rank.Score  \tab numeric   \tab Mean rank in the command structure\cr
#'   Decision.Rank.Score \tab numeric   \tab Mean rank in the decision process\cr
#'   Formalization       \tab numeric   \tab Degree of formalization\cr
#'   Location            \tab character \tab Location code\cr
#'   Paid.Staff          \tab numeric   \tab Number of paid staff\cr
#'   Sponsorship         \tab character \tab Sponsorship type\cr
#'   vertex.names        \tab character \tab Organization name\cr
#'   Volunteer.Staff     \tab numeric   \tab Number of volunteer staff
#'  }
#'
#'
#' @details
#' All networks collected by Drabek et al. reflect reported frequency of
#' organizational interaction during the search and rescue effort; the (i,j)
#' edge constitutes i's report regarding interaction with j, with non-adjacent
#' vertices reporting no contact.  Frequency is rated on a four-point scale,
#' with 1 indicating the highest frequency of interaction.  (Response options:
#' 1=\dQuote{continuously}, 2=\dQuote{about once an hour}, 3=\dQuote{every few
#' hours}, 4=\dQuote{about once a day or less}) This is stored within the
#' \code{"Frequency"} edge attribute.
#'
#' For each network, several covariates are recorded as vertex attributes:
#'
#' \describe{
#' \item{Command.Rank.Score}{ Mean (reversed) rank for the
#'   prominence of each organization in the command structure of the response, as
#'   judged by organizational informants.}
#' \item{Decision.Rank.Score}{ Mean (reversed) rank for the
#'   prominence of each organization in decision making
#'   processes during the response, as judged by organizational informants.}
#' \item{Formalization}{ An index of organizational formalization, ranging from
#'   0 (least formalized) to 4 (most formalized).} \item{Localization}{ For each
#'   organization, \code{"L"} if the organization was sited locally to the impact
#'   area, \code{"NL"} if the organization was not sited near the impact area,
#'   \code{"B"} if the organization was sited at both local and non-local
#'   locations.}
#' \item{Paid.Staff}{ Number of paid staff employed by each
#'   organization at the time of the response.}
#' \item{Sponsorship}{ The level at which each organization
#'   was sponsored (e.g., \code{"City"}, \code{"County"},
#'   \code{"State"}, \code{"Federal"}, and \code{"Private"}).}
#' \item{vertex.names}{ The identity of each organization.}
#' \item{Volunteer.Staff}{ Number of volunteer staff employed by each
#'   organization at the time of the response.}
#' }
#'
#' Note that where intervals were given by the original source, midpoints have
#' been substituted.  For detailed information regarding data coding and
#' procedures, see Drabek et al. (1981).
#'
#' @template data
#'
#' @source Drabek, T.E.; Tamminga, H.L.; Kilijanek, T.S.; and Adams, C.R.
#'   (1981). *Data from Managing Multiorganizational Emergency Responses:
#'   Emergent Search and Rescue Networks in Natural Disaster and Remote Area
#'   Settings*. Program on Technology, Environment, and Man Monograph 33.
#'   Institute for Behavioral Science, University of Colorado.
#'
#' @keywords datasets
#' @family directed networks
#'
#'
#' @examples
#' #Plot the EMONs
#' if(requireNamespace("network", quietly=TRUE)) {
#' par(mfrow=c(3,3))
#' for(i in 1:length(emon))
#'   plot(emon[[i]],main=names(emon)[i],edge.lwd="Frequency")
#' }
"emon"
