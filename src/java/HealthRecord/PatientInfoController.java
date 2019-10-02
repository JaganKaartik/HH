/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;

/**
 *
 * @author jagankaartik58
 */

/*

	Controller: To View Patient Information

	Use POJO or DAO for Fetching Information via JDBC

*/

import javax.servlet.http.*;
import javax.servlet.ServletException;

public class PatientInfoController extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse rep) throws ServletException
    {
        // Accept Search Query for Patient ID or name

        String search_query = req.getParameter("search");




    }
}
