using api.Application.Venues;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public sealed class VenuesController : ControllerBase
{
    [HttpGet("today")]
    public async Task<ActionResult<IReadOnlyList<VenueCardDto>>> GetToday(
        [FromServices] GetTodayVenueCardsUseCase useCase,
        CancellationToken cancellationToken)
    {
        var venues = await useCase.ExecuteAsync(cancellationToken);
        return Ok(venues);
    }
}
