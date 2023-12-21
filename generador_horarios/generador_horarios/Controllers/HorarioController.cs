using System.Web.Mvc;
using MiProyecto; 

namespace MiProyecto.Controllers
{
	public class HorarioController : Controller
	{
		public ActionResult Generar()
		{
			GeneradorHorario generador = new GeneradorHorario();
			generador.GenerarHorario();
			return Content("Horario generado y guardado en la base de datos");
		}
	}
}
