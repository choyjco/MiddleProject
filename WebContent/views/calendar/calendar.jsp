<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="calendar-section">
					<div class="row no-gutters">
						<div class="col-md-6">
							<div class="calendar calendar-first" id="calendar_first">
								<div class="calendar_header">
									<button class="switch-month switch-left">
										<i class="fa fa-chevron-left"></i>
									</button>
									<h2></h2>
									<button class="switch-month switch-right">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<div class="calendar_weekdays"></div>
								<div class="calendar_content"></div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="calendar calendar-second" id="calendar_second">
								<div class="calendar_header">
									<button class="switch-month switch-left">
										<i class="fa fa-chevron-left"></i>
									</button>
									<h2></h2>
									<button class="switch-month switch-right">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<div class="calendar_weekdays"></div>
								<div class="calendar_content"></div>
							</div>

						</div>

					</div>
					<!-- End Row -->

				</div>
				<!-- End Calendar -->
			</div>
		</div>
	</div>
</section>

<script src="/JejuOlleh/js/calendar/jquery.min.js"></script>
<script src="/JejuOlleh/js/calendar/popper.js"></script>
<script src="/JejuOlleh/js/calendar/calendarmain.js"></script>